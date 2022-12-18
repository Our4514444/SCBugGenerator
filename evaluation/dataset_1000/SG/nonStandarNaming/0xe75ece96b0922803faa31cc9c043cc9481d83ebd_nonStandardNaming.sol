pragma solidity ^0.5.8;

                                                                   

 
                                                                                                                                  

contract SafeMath {
  function MUL695(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function SAFEDIV975(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SAFESUB942(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function SAFEADD799(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}




                                                                                                                       
contract Token {
  
  function TOTALSUPPLY637() public view returns (uint256 supply);	//inject NONSTANDARD NAMING
  function BALANCEOF919(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function TRANSFER507(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM54(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE997(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function ALLOWANCE530(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING
  event TRANSFER495(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
  event APPROVAL551(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}



                                                                                                             
contract AbstractToken is Token, SafeMath {
                                                    
  constructor () public {
    // Do nothing
  }
  
                                                                                                                                                                                                                                                                 
  function BALANCEOF919(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return accounts [_owner];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                    
  function TRANSFER507(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    if (accounts [msg.sender] < _value) return false;
    if (_value > 0 && msg.sender != _to) {
      accounts [msg.sender] = SAFESUB942 (accounts [msg.sender], _value);
      accounts [_to] = SAFEADD799 (accounts [_to], _value);
    }
    emit TRANSFER495 (msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TRANSFERFROM54(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
  returns (bool success) {
    require(_to != address(0));
    if (allowances [_from][msg.sender] < _value) return false;
    if (accounts [_from] < _value) return false; 

    if (_value > 0 && _from != _to) {
	  allowances [_from][msg.sender] = SAFESUB942 (allowances [_from][msg.sender], _value);
      accounts [_from] = SAFESUB942 (accounts [_from], _value);
      accounts [_to] = SAFEADD799 (accounts [_to], _value);
    }
    emit TRANSFER495(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                              
   function APPROVE997 (address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowances [msg.sender][_spender] = _value;
    emit APPROVAL551 (msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function ALLOWANCE530(address _owner, address _spender) public view	//inject NONSTANDARD NAMING
  returns (uint256 remaining) {
    return allowances [_owner][_spender];
  }

                                                                                                                        
  mapping (address => uint256) accounts;

                                                                                                                                                                     
  mapping (address => mapping (address => uint256)) private allowances;
  
}


                                   
contract K99 is AbstractToken {
                                                                                                                          
   
   
  uint256 constant max_token_count322 = 100000000 * (10**18);	//inject NONSTANDARD NAMING
   
                                                             
  address private owner;
  
                                           
  mapping (address => bool) private frozenAccount;

                                                         
  uint256 tokenCount = 0;
  
 
                                                                                
  bool frozen = false;
  
 
                                                                                                           
  constructor () public {
    owner = msg.sender;
  }

                                                                                                                   
  function TOTALSUPPLY637() public view returns (uint256 supply) {	//inject NONSTANDARD NAMING
    return tokenCount;
  }

  string constant public name198 = "Krypto99";	//inject NONSTANDARD NAMING
  string constant public symbol283 = "K99";	//inject NONSTANDARD NAMING
  uint8 constant public decimals876 = 18;	//inject NONSTANDARD NAMING
  
                                                                                                                                                                                                                                                                                                            
  function TRANSFER507(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(!frozenAccount[msg.sender]);
	if (frozen) return false;
    else return AbstractToken.TRANSFER507 (_to, _value);
  }

                                                                                                                                                                                                                                                                                                                                                                                               
  function TRANSFERFROM54(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
	require(!frozenAccount[_from]);
    if (frozen) return false;
    else return AbstractToken.TRANSFERFROM54 (_from, _to, _value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function APPROVE997 (address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
	require(ALLOWANCE530 (msg.sender, _spender) == 0 || _value == 0);
    return AbstractToken.APPROVE997 (_spender, _value);
  }

                                                                                                                                                                                                                                                               
  function CREATETOKENS929(uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
    require (msg.sender == owner);

    if (_value > 0) {
      if (_value > SAFESUB942 (max_token_count322, tokenCount)) return false;
	  
      accounts [msg.sender] = SAFEADD799 (accounts [msg.sender], _value);
      tokenCount = SAFEADD799 (tokenCount, _value);
	  
	  // adding transfer event and _from address as null address
	  emit TRANSFER495(address(0), msg.sender, _value);
	  
	  return true;
    }
	
	  return false;
    
  }
  

                                                                                                                                                                             
  function SETOWNER722(address _newOwner) public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    owner = _newOwner;
  }

                                                                                             
  function FREEZETRANSFERS514 () public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    if (!frozen) {
      frozen = true;
      emit FREEZE941 ();
    }
  }

                                                                                               
  function UNFREEZETRANSFERS33 () public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    if (frozen) {
      frozen = false;
      emit UNFREEZE500 ();
    }
  }
  
  
                                                                                                                                                                                                                                                                                                                                                                                                               
  
  function REFUNDTOKENS368(address _token, address _refund, uint256 _value) public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);
    require(_token != address(this));
    AbstractToken token = AbstractToken(_token);
    token.TRANSFER507(_refund, _value);
    emit REFUNDTOKENS89(_token, _refund, _value);
  }
  
                                                                                         
  function FREEZEACCOUNT510(address _target, bool freeze) public {	//inject NONSTANDARD NAMING
      require (msg.sender == owner);
	  require (msg.sender != _target);
      frozenAccount[_target] = freeze;
      emit FROZENFUNDS82(_target, freeze);
 }

                                                         
  event FREEZE941 ();	//inject NONSTANDARD NAMING

                                                           
  event UNFREEZE500 ();	//inject NONSTANDARD NAMING
  
                                                            
  
  event FROZENFUNDS82(address target, bool frozen);	//inject NONSTANDARD NAMING


  
                                                                 
  
  event REFUNDTOKENS89(address _token, address _refund, uint256 _value);	//inject NONSTANDARD NAMING
}