pragma solidity ^0.5.7;

                                                                     

 
                                                                                                                                  

contract SafeMath {
  function MUL348(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function SAFEDIV572(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SAFESUB98(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function SAFEADD868(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}




                                                                                                                       
contract Token {
  
  function TOTALSUPPLY629() public view returns (uint256 supply);	//inject NONSTANDARD NAMING
  function BALANCEOF96(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function TRANSFER792(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM453(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE196(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function ALLOWANCE443(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING
  event TRANSFER974(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
  event APPROVAL735(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}



                                                                                                             
contract AbstractToken is Token, SafeMath {
                                                    
  constructor () public {
    // Do nothing
  }
  
                                                                                                                                                                                                                                                                 
  function BALANCEOF96(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return accounts [_owner];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                    
  function TRANSFER792(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    if (accounts [msg.sender] < _value) return false;
    if (_value > 0 && msg.sender != _to) {
      accounts [msg.sender] = SAFESUB98 (accounts [msg.sender], _value);
      accounts [_to] = SAFEADD868 (accounts [_to], _value);
    }
    emit TRANSFER974 (msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TRANSFERFROM453(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
  returns (bool success) {
    require(_to != address(0));
    if (allowances [_from][msg.sender] < _value) return false;
    if (accounts [_from] < _value) return false; 

    if (_value > 0 && _from != _to) {
	  allowances [_from][msg.sender] = SAFESUB98 (allowances [_from][msg.sender], _value);
      accounts [_from] = SAFESUB98 (accounts [_from], _value);
      accounts [_to] = SAFEADD868 (accounts [_to], _value);
    }
    emit TRANSFER974(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                              
   function APPROVE196 (address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowances [msg.sender][_spender] = _value;
    emit APPROVAL735 (msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function ALLOWANCE443(address _owner, address _spender) public view	//inject NONSTANDARD NAMING
  returns (uint256 remaining) {
    return allowances [_owner][_spender];
  }

                                                                                                                        
  mapping (address => uint256) accounts;

                                                                                                                                                                     
  mapping (address => mapping (address => uint256)) private allowances;
  
}


                                    
contract MDC is AbstractToken {
                                                                                                                          
   
   
  uint256 constant max_token_count266 = 250000000 * (10**18);	//inject NONSTANDARD NAMING
   
                                                             
  address private owner;
  
                                           
  mapping (address => bool) private frozenAccount;

                                                         
  uint256 tokenCount = 0;
  
 
                                                                                
  bool frozen = false;
  
 
                                                                                                           
  constructor () public {
    owner = msg.sender;
  }

                                                                                                                   
  function TOTALSUPPLY629() public view returns (uint256 supply) {	//inject NONSTANDARD NAMING
    return tokenCount;
  }

  string constant public name225 = "MidasCoin";	//inject NONSTANDARD NAMING
  string constant public symbol149 = "MDC";	//inject NONSTANDARD NAMING
  uint8 constant public decimals154 = 18;	//inject NONSTANDARD NAMING
  
                                                                                                                                                                                                                                                                                                              
  function TRANSFER792(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(!frozenAccount[msg.sender]);
	if (frozen) return false;
    else return AbstractToken.TRANSFER792 (_to, _value);
  }

                                                                                                                                                                                                                                                                                                                                                                                               
  function TRANSFERFROM453(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
	require(!frozenAccount[_from]);
    if (frozen) return false;
    else return AbstractToken.TRANSFERFROM453 (_from, _to, _value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function APPROVE196 (address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
	require(ALLOWANCE443 (msg.sender, _spender) == 0 || _value == 0);
    return AbstractToken.APPROVE196 (_spender, _value);
  }

                                                                                                                                                                                                                                                               
  function CREATETOKENS203(uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
    require (msg.sender == owner);

    if (_value > 0) {
      if (_value > SAFESUB98 (max_token_count266, tokenCount)) return false;
	  
      accounts [msg.sender] = SAFEADD868 (accounts [msg.sender], _value);
      tokenCount = SAFEADD868 (tokenCount, _value);
	  
	  // adding transfer event and _from address as null address
	  emit TRANSFER974(address(0), msg.sender, _value);
	  
	  return true;
    }
	
	  return false;
    
  }
  
                                                                                                                                                                                                                                                                                                                                                  
  
  function MINTTOKEN203(address target, uint256 mintedAmount) public	//inject NONSTANDARD NAMING
  returns (bool success) {
    require (msg.sender == owner);
      if (mintedAmount > 0) {
	  
      accounts [target] = SAFEADD868 (accounts [target], mintedAmount);
      tokenCount = SAFEADD868 (tokenCount, mintedAmount);
	  
	  // adding transfer event and _from address as null address
	  emit TRANSFER974(address(0), target, mintedAmount);
	  
	   return true;
    }
	  return false;
   
    }
	
                                                                                                                                                                                              
  
  function BURN900(uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
  
        require(accounts[msg.sender] >= _value); 
		
		require (msg.sender == owner);
		
		accounts [msg.sender] = SAFESUB98 (accounts [msg.sender], _value);
		
        tokenCount = SAFESUB98 (tokenCount, _value);	
		
        emit BURN169(msg.sender, _value);
		
        return true;
    }	
  

                                                                                                                                                                             
  function SETOWNER675(address _newOwner) public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    owner = _newOwner;
  }

                                                                                             
  function FREEZETRANSFERS191 () public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    if (!frozen) {
      frozen = true;
      emit FREEZE660 ();
    }
  }

                                                                                               
  function UNFREEZETRANSFERS365 () public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    if (frozen) {
      frozen = false;
      emit UNFREEZE691 ();
    }
  }
  
  
                                                                                                                                                                                                                                                                                                                                                                                                               
  
  function REFUNDTOKENS57(address _token, address _refund, uint256 _value) public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);
    require(_token != address(this));
    AbstractToken token = AbstractToken(_token);
    token.TRANSFER792(_refund, _value);
    emit REFUNDTOKENS201(_token, _refund, _value);
  }
  
                                                                                         
  function FREEZEACCOUNT809(address _target, bool freeze) public {	//inject NONSTANDARD NAMING
      require (msg.sender == owner);
	  require (msg.sender != _target);
      frozenAccount[_target] = freeze;
      emit FROZENFUNDS98(_target, freeze);
 }

                                                         
  event FREEZE660 ();	//inject NONSTANDARD NAMING

                                                           
  event UNFREEZE691 ();	//inject NONSTANDARD NAMING
  
                                                            
  
  event FROZENFUNDS98(address target, bool frozen);	//inject NONSTANDARD NAMING
  
                                                 
  
  event BURN169(address target,uint256 _value);	//inject NONSTANDARD NAMING


  
                                                                 
  
  event REFUNDTOKENS201(address _token, address _refund, uint256 _value);	//inject NONSTANDARD NAMING
}