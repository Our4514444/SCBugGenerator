pragma solidity 0.5.6;

                                        
interface XcertMutable // is Xcert
{
  
                                                                                                                    
  function UPDATETOKENIMPRINT42(	//inject NONSTANDARD NAMING
    uint256 _tokenId,
    bytes32 _imprint
  )
    external;

}

                                                                                                                                                                                                                            
library SafeMath
{

                                      
  string constant overflow760 = "008001";	//inject NONSTANDARD NAMING
  string constant subtrahend_greater_then_minuend390 = "008002";	//inject NONSTANDARD NAMING
  string constant division_by_zero40 = "008003";	//inject NONSTANDARD NAMING

                                                                                                                                                                                       
  function MUL506(	//inject NONSTANDARD NAMING
    uint256 _factor1,
    uint256 _factor2
  )
    internal
    pure
    returns (uint256 product)
  {
    // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (_factor1 == 0)
    {
      return 0;
    }

    product = _factor1 * _factor2;
    require(product / _factor1 == _factor2, overflow760);
  }

                                                                                                                                                                                                                   
  function DIV913(	//inject NONSTANDARD NAMING
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 quotient)
  {
    // Solidity automatically asserts when dividing by 0, using all gas.
    require(_divisor > 0, division_by_zero40);
    quotient = _dividend / _divisor;
    // assert(_dividend == _divisor * quotient + _dividend % _divisor); // There is no case in which this doesn't hold.
  }

                                                                                                                                                                                                                       
  function SUB144(	//inject NONSTANDARD NAMING
    uint256 _minuend,
    uint256 _subtrahend
  )
    internal
    pure
    returns (uint256 difference)
  {
    require(_subtrahend <= _minuend, subtrahend_greater_then_minuend390);
    difference = _minuend - _subtrahend;
  }

                                                                                                                                        
  function ADD829(	//inject NONSTANDARD NAMING
    uint256 _addend1,
    uint256 _addend2
  )
    internal
    pure
    returns (uint256 sum)
  {
    sum = _addend1 + _addend2;
    require(sum >= _addend1, overflow760);
  }

                                                                                                                                                                                                                           
  function MOD138(	//inject NONSTANDARD NAMING
    uint256 _dividend,
    uint256 _divisor
  )
    internal
    pure
    returns (uint256 remainder) 
  {
    require(_divisor != 0, division_by_zero40);
    remainder = _dividend % _divisor;
  }

}

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
contract Abilitable
{
  using SafeMath for uint;

                                      
  string constant not_authorized666 = "017001";	//inject NONSTANDARD NAMING
  string constant cannot_revoke_own_super_ability133 = "017002";	//inject NONSTANDARD NAMING
  string constant invalid_input521 = "017003";	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                              
  uint8 constant super_ability83 = 1;	//inject NONSTANDARD NAMING

                                                  
  mapping(address => uint256) public addressToAbility;

                                                                                                                                                                                                                    
  event GRANTABILITIES363(	//inject NONSTANDARD NAMING
    address indexed _target,
    uint256 indexed _abilities
  );

                                                                                                                                                                                                                       
  event REVOKEABILITIES756(	//inject NONSTANDARD NAMING
    address indexed _target,
    uint256 indexed _abilities
  );

                                                                       
  modifier HASABILITIES410(	//inject NONSTANDARD NAMING
    uint256 _abilities
  ) 
  {
    require(_abilities > 0, invalid_input521);
    require(
      addressToAbility[msg.sender] & _abilities == _abilities,
      not_authorized666
    );
    _;
  }

                                                                                                  
  constructor()
    public
  {
    addressToAbility[msg.sender] = super_ability83;
    emit GRANTABILITIES363(msg.sender, super_ability83);
  }

                                                                                                                                                                                                          
  function GRANTABILITIES77(	//inject NONSTANDARD NAMING
    address _target,
    uint256 _abilities
  )
    external
    HASABILITIES410(super_ability83)
  {
    addressToAbility[_target] |= _abilities;
    emit GRANTABILITIES363(_target, _abilities);
  }

                                                                                                                                                                                                                                                                                                                                            
  function REVOKEABILITIES966(	//inject NONSTANDARD NAMING
    address _target,
    uint256 _abilities,
    bool _allowSuperRevoke
  )
    external
    HASABILITIES410(super_ability83)
  {
    if (!_allowSuperRevoke && msg.sender == _target)
    {
      require((_abilities & 1) == 0, cannot_revoke_own_super_ability133);
    }
    addressToAbility[_target] &= ~_abilities;
    emit REVOKEABILITIES756(_target, _abilities);
  }

                                                                                                                                                                                                                                                                    
  function ISABLE581(	//inject NONSTANDARD NAMING
    address _target,
    uint256 _abilities
  )
    external
    view
    returns (bool)
  {
    require(_abilities > 0, invalid_input521);
    return (addressToAbility[_target] & _abilities) == _abilities;
  }
  
}

                                                                                                                                                                                                                                                                                                               
contract XcertUpdateProxy is
  Abilitable
{

                                                                            
  uint8 constant ability_to_execute6 = 2;	//inject NONSTANDARD NAMING

                                                                                                                                                                                                                                              
  function UPDATE803(	//inject NONSTANDARD NAMING
    address _xcert,
    uint256 _id,
    bytes32 _imprint
  )
    external
    HASABILITIES410(ability_to_execute6)
  {
    XcertMutable(_xcert).UPDATETOKENIMPRINT42(_id, _imprint);
  }

}