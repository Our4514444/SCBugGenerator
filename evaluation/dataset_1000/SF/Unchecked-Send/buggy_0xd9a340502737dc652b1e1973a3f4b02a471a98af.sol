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

  function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}




/**
 * ERC-20 standard token interface, as defined
 * <a href="http://github.com/ethereum/EIPs/issues/20">here</a>.
 */
contract Token {
  
  function totalSupply() public view returns (uint256 supply);
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  function balanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  
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
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Mapping from addresses of token holders to the numbers of tokens belonging
   * to these token holders.
   */
  mapping (address => uint256) accounts;

  /**
   * Mapping from addresses of token holders to the mapping of addresses of
   * spenders to the allowances set by these token holders to these spenders.
   */
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
  address private owner;
  
  /**
   * Frozen account list holder
   */
  mapping (address => bool) private frozenAccount;

  /**
   * Current number of tokens in circulation.
   */
  uint256 tokenCount = 0;
  
 
  /**
   * True if tokens transfers are currently frozen, false otherwise.
   */
  bool frozen = false;
  
 
  /**
   * Create new token smart contract and make msg.sender the
   * owner of this smart contract.
   */
  constructor () public {
    owner = msg.sender;
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Get total number of tokens in circulation.
   *
   * @return total number of tokens in circulation
   */
  function totalSupply() public view returns (uint256 supply) {
    return tokenCount;
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

  string constant public name = "MidasCoin";
  string constant public symbol = "MDC";
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
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  
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
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
	
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
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}	
  

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
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  
  
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
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
  
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
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  /**
   * Logged when token transfers were frozen.
   */
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event Freeze ();

  /**
   * Logged when token transfers were unfrozen.
   */
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event Unfreeze ();
  
  /**
   * Logged when a particular account is frozen.
   */
  
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event FrozenFunds(address target, bool frozen);
  
   /**
   * Logged when a token is burnt.
   */  
  
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Burn(address target,uint256 _value);


  
  /**
   * when accidentally send other tokens are refunded
   */
  
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event RefundTokens(address _token, address _refund, uint256 _value);
}