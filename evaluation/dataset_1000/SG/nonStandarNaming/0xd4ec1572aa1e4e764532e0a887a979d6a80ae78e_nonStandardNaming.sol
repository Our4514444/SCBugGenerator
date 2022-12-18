pragma solidity ^0.5.7;

                                                                  

 
                                                                                                                                  

contract SafeMath {
  function MUL358(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function SAFEDIV125(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SAFESUB370(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function SAFEADD276(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}




                                                                                                                       
contract Token {
  
  function TOTALSUPPLY406() public view returns (uint256 supply);	//inject NONSTANDARD NAMING
  function BALANCEOF526(address _owner) public view returns (uint256 balance);	//inject NONSTANDARD NAMING
  function TRANSFER307(address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function TRANSFERFROM41(address _from, address _to, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function APPROVE944(address _spender, uint256 _value) public returns (bool success);	//inject NONSTANDARD NAMING
  function ALLOWANCE548(address _owner, address _spender) public view returns (uint256 remaining);	//inject NONSTANDARD NAMING
  event TRANSFER766(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
  event APPROVAL172(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}



                                                                                                             
contract AbstractToken is Token, SafeMath {
                                                    
  constructor () public {
    // Do nothing
  }
  
                                                                                                                                                                                                                                                                 
  function BALANCEOF526(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return accounts [_owner];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                    
  function TRANSFER307(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
    if (accounts [msg.sender] < _value) return false;
    if (_value > 0 && msg.sender != _to) {
      accounts [msg.sender] = SAFESUB370 (accounts [msg.sender], _value);
      accounts [_to] = SAFEADD276 (accounts [_to], _value);
    }
    emit TRANSFER766 (msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
  function TRANSFERFROM41(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
  returns (bool success) {
    require(_to != address(0));
    if (allowances [_from][msg.sender] < _value) return false;
    if (accounts [_from] < _value) return false; 

    if (_value > 0 && _from != _to) {
	  allowances [_from][msg.sender] = SAFESUB370 (allowances [_from][msg.sender], _value);
      accounts [_from] = SAFESUB370 (accounts [_from], _value);
      accounts [_to] = SAFEADD276 (accounts [_to], _value);
    }
    emit TRANSFER766(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                              
   function APPROVE944 (address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    allowances [msg.sender][_spender] = _value;
    emit APPROVAL172 (msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                 
  function ALLOWANCE548(address _owner, address _spender) public view	//inject NONSTANDARD NAMING
  returns (uint256 remaining) {
    return allowances [_owner][_spender];
  }

                                                                                                                        
  mapping (address => uint256) accounts;

                                                                                                                                                                     
  mapping (address => mapping (address => uint256)) private allowances;
  
}


                                  
contract Dyner is AbstractToken {
                                                                                                                          
   
   
  uint256 constant max_token_count354 = 100000000 * (10**10);	//inject NONSTANDARD NAMING
   
                                                             
  address public owner;
  
                                           
  mapping (address => bool) private frozenAccount;

                                                         
  uint256 tokenCount = 0;
  
 
                                                                                
  bool frozen = false;
  
 
                                                                                                           
  constructor () public {
    owner = msg.sender;
  }

                                                                                                                   
  function TOTALSUPPLY406() public view returns (uint256 supply) {	//inject NONSTANDARD NAMING
    return tokenCount;
  }

  string constant public name522 = "Dyneros";	//inject NONSTANDARD NAMING
  string constant public symbol437 = "Dyner";	//inject NONSTANDARD NAMING
  uint8 constant public decimals796 = 10;	//inject NONSTANDARD NAMING
  
                                                                                                                                                                                                                                                                                                            
  function TRANSFER307(address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
    require(!frozenAccount[msg.sender]);
	if (frozen) return false;
    else return AbstractToken.TRANSFER307 (_to, _value);
  }

                                                                                                                                                                                                                                                                                                                                                                                               
  function TRANSFERFROM41(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
	require(!frozenAccount[_from]);
    if (frozen) return false;
    else return AbstractToken.TRANSFERFROM41 (_from, _to, _value);
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
  function APPROVE944 (address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
	require(ALLOWANCE548 (msg.sender, _spender) == 0 || _value == 0);
    return AbstractToken.APPROVE944 (_spender, _value);
  }

                                                                                                                                                                                                                                                               
  function CREATETOKENS571(uint256 _value) public	//inject NONSTANDARD NAMING
    returns (bool success) {
    require (msg.sender == owner);

    if (_value > 0) {
      if (_value > SAFESUB370 (max_token_count354, tokenCount)) return false;
	  
      accounts [msg.sender] = SAFEADD276 (accounts [msg.sender], _value);
      tokenCount = SAFEADD276 (tokenCount, _value);
	  
	  // adding transfer event and _from address as null address
	  emit TRANSFER766(address(0), msg.sender, _value);
	  
	  return true;
    }
	
	  return false;
    
  }
  

                                                                                                                                                                             
  function SETOWNER352(address _newOwner) public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    owner = _newOwner;
  }

                                                                                             
  function FREEZETRANSFERS907 () public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    if (!frozen) {
      frozen = true;
      emit FREEZE967 ();
    }
  }

                                                                                               
  function UNFREEZETRANSFERS342 () public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);

    if (frozen) {
      frozen = false;
      emit UNFREEZE617 ();
    }
  }
  
  
                                                                                                                                                                                                                                                                                                                                                                                                               
  
  function REFUNDTOKENS770(address _token, address _refund, uint256 _value) public {	//inject NONSTANDARD NAMING
    require (msg.sender == owner);
    require(_token != address(this));
    AbstractToken token = AbstractToken(_token);
    token.TRANSFER307(_refund, _value);
    emit REFUNDTOKENS453(_token, _refund, _value);
  }
  
                                                                                         
  function FREEZEACCOUNT439(address _target, bool freeze) public {	//inject NONSTANDARD NAMING
      require (msg.sender == owner);
	  require (msg.sender != _target);
      frozenAccount[_target] = freeze;
      emit FROZENFUNDS505(_target, freeze);
 }

                                                         
  event FREEZE967 ();	//inject NONSTANDARD NAMING

                                                           
  event UNFREEZE617 ();	//inject NONSTANDARD NAMING
  
                                                            
  
  event FROZENFUNDS505(address target, bool frozen);	//inject NONSTANDARD NAMING


  
                                                                 
  
  event REFUNDTOKENS453(address _token, address _refund, uint256 _value);	//inject NONSTANDARD NAMING
}