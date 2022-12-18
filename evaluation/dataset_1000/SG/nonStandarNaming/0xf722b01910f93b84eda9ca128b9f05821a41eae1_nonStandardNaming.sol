pragma solidity ^0.5.1;

                                                                         

                                                                                                                                                                                             
contract Ownable {
  address public owner;


  event OWNERSHIPRENOUNCED464(address indexed previousOwner);	//inject NONSTANDARD NAMING
  event OWNERSHIPTRANSFERRED730(	//inject NONSTANDARD NAMING
    address indexed previousOwner,
    address indexed newOwner
  );


                                                                                                                   
  constructor() public {
    owner = msg.sender;
  }

                                                                           
  modifier ONLYOWNER727() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                             
  function TRANSFEROWNERSHIP955(address _newOwner) public ONLYOWNER727 {	//inject NONSTANDARD NAMING
    _TRANSFEROWNERSHIP971(_newOwner);
  }

                                                                                                                                  
  function _TRANSFEROWNERSHIP971(address _newOwner) internal {	//inject NONSTANDARD NAMING
    require(_newOwner != address(0));
    emit OWNERSHIPTRANSFERRED730(owner, _newOwner);
    owner = _newOwner;
  }
}

                                                                                            
library SafeMath {

                                                               
  function MUL777(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    // Gas optimization: this is cheaper than asserting 'a' not being zero, but the
    // benefit is lost if 'b' is also tested.
    // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
    if (a == 0) {
      return 0;
    }

    c = a * b;
    assert(c / a == b);
    return c;
  }

                                                                             
  function DIV536(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

                                                                                                           
  function SUB50(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

                                                         
  function ADD683(uint256 a, uint256 b) internal pure returns (uint256 c) {	//inject NONSTANDARD NAMING
    c = a + b;
    assert(c >= a);
    return c;
  }
}

                                                                                                                          
contract ERC20Basic {
  function TOTALSUPPLY770() public view returns (uint256);	//inject NONSTANDARD NAMING
  function BALANCEOF287(address who) public view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER705(address to, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER853(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
}

                                                                                        
contract ERC20 is ERC20Basic {
  function ALLOWANCE57(address owner, address spender)	//inject NONSTANDARD NAMING
    public view returns (uint256);

  function TRANSFERFROM547(address from, address to, uint256 value)	//inject NONSTANDARD NAMING
    public returns (bool);

  function APPROVE398(address spender, uint256 value) public returns (bool);	//inject NONSTANDARD NAMING
  event APPROVAL187(	//inject NONSTANDARD NAMING
    address indexed owner,
    address indexed spender,
    uint256 value
  );
}

                                                                                            
contract BasicToken is ERC20Basic {
  using SafeMath for uint256;

  mapping(address => uint256) balances;

  uint256 totalSupply_;

                                                       
  function TOTALSUPPLY770() public view returns (uint256) {	//inject NONSTANDARD NAMING
    return totalSupply_;
  }

                                                                                                                                                     
  function TRANSFER705(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_value <= balances[msg.sender]);
    require(_to != address(0));

    balances[msg.sender] = balances[msg.sender].SUB50(_value);
    balances[_to] = balances[_to].ADD683(_value);
    emit TRANSFER853(msg.sender, _to, _value);
    return true;
  }

                                                                                                                                                                                                     
  function BALANCEOF287(address _owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
    return balances[_owner];
  }

}


                                                                                          
contract StandardToken is ERC20, BasicToken {

  mapping (address => mapping (address => uint256)) internal allowed;

                                                                                                                                                                                                                                                                              
  function TRANSFERFROM547(	//inject NONSTANDARD NAMING
    address _from,
    address _to,
    uint256 _value
  )
    public
    returns (bool)
  {
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);
    require(_to != address(0));

    balances[_from] = balances[_from].SUB50(_value);
    balances[_to] = balances[_to].ADD683(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].SUB50(_value);
    emit TRANSFER853(_from, _to, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  function APPROVE398(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    allowed[msg.sender][_spender] = _value;
    emit APPROVAL187(msg.sender, _spender, _value);
    return true;
  }

                                                                                                                                                                                                                                                                                                                          
  function ALLOWANCE57(	//inject NONSTANDARD NAMING
    address _owner,
    address _spender
   )
    public
    view
    returns (uint256)
  {
    return allowed[_owner][_spender];
  }

                                                                                                                                                                                                                                                                                                                                                                                                                               
  function INCREASEAPPROVAL521(	//inject NONSTANDARD NAMING
    address _spender,
    uint256 _addedValue
  )
    public
    returns (bool)
  {
    allowed[msg.sender][_spender] = (
      allowed[msg.sender][_spender].ADD683(_addedValue));
    emit APPROVAL187(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

                                                                                                                                                                                                                                                                                                                                                                                                                                    
  function DECREASEAPPROVAL331(	//inject NONSTANDARD NAMING
    address _spender,
    uint256 _subtractedValue
  )
    public
    returns (bool)
  {
    uint256 oldValue = allowed[msg.sender][_spender];
    if (_subtractedValue >= oldValue) {
      allowed[msg.sender][_spender] = 0;
    } else {
      allowed[msg.sender][_spender] = oldValue.SUB50(_subtractedValue);
    }
    emit APPROVAL187(msg.sender, _spender, allowed[msg.sender][_spender]);
    return true;
  }

}


                                                                            
contract MintableTokenWithCap is StandardToken, Ownable {

  event MINT20(address indexed to, uint256 amount);	//inject NONSTANDARD NAMING

  uint256 public constant total_token_cap694      = 78000000 * 10 ** 18; // Maximum amount of tokens	//inject NONSTANDARD NAMING
  uint256 public constant pre_minted_token_cap357 = 24100000 * 10 ** 18; // Amount of pre minted tokens	//inject NONSTANDARD NAMING

  uint256 public constant pre_minting_end856      = 1577750400; // x1 - 2019-12-31T00:00:00+00:00 - Pre minting end Timestamp	//inject NONSTANDARD NAMING
  uint256 public constant minting_end204          = 3187295999; // x2 - 2070-12-31T23:59:59+00:00 - Minting end Timestamp	//inject NONSTANDARD NAMING


  modifier HASMINTPERMISSION662() {	//inject NONSTANDARD NAMING
    require(msg.sender == owner);
    _;
  }

                                                                                                                                                                                                                                       
  function MINT733(	//inject NONSTANDARD NAMING
    address _to,
    uint256 _amount
  )
    HASMINTPERMISSION662
    public
    returns (bool)
  {
    require(totalSupply_ + _amount <= GETCURRENTMINTINGLIMIT5());

    totalSupply_ = totalSupply_.ADD683(_amount);
    balances[_to] = balances[_to].ADD683(_amount);
    emit MINT20(_to, _amount);
    emit TRANSFER853(address(0), _to, _amount);
    return true;
  }

  function GETCURRENTMINTINGLIMIT5()	//inject NONSTANDARD NAMING
    public
    view
    returns(uint256)
  {
    if(now <= pre_minting_end856) {

      return pre_minted_token_cap357;
    }
    else if(now <= minting_end204) {

      // Logarithmic approximation until MINTING_END
      // qfactor = (ln(2x + 0.2) - ln(0.2)) / (ln(2.2)-ln(0.2))
      // Pre calculated values are used for efficiency reasons

      if(now <= 1609459199) { // 12/31/2020 @ 11:59pm (UTC)
            return 28132170 *10 ** 18;
      }
      else if(now <= 1640995199) { // 12/31/2021 @ 11:59pm (UTC)
            return 31541205 *10 ** 18;
      }
      else if(now <= 1672531199) { // 12/31/2022 @ 11:59pm (UTC)
            return 34500660 *10 ** 18;
      }
      else if(now <= 1704067199) { // 12/31/2023 @ 11:59pm (UTC)
            return 37115417 *10 ** 18;
      }
      else if(now <= 1735603199) { // 12/31/2024 @ 11:59pm (UTC)
            return 39457461 *10 ** 18;
      }
      else if(now <= 1767225599) { // 12/31/2025 @ 11:59pm (UTC)
            return 41583887 *10 ** 18;
      }
      else if(now <= 1798761599) { // 12/31/2026 @ 11:59pm (UTC)
            return 43521339 *10 ** 18;
      }
      else if(now <= 1830297599) { // 12/31/2027 @ 11:59pm (UTC)
            return 45304967 *10 ** 18;
      }
      else if(now <= 1861919999) { // 12/31/2028 @ 11:59pm (UTC)
            return 46961775 *10 ** 18;
      }
      else if(now <= 1893455999) { // 12/31/2029 @ 11:59pm (UTC)
            return 48500727 *10 ** 18;
      }
      else if(now <= 1924991999) { // 12/31/2030 @ 11:59pm (UTC)
            return 49941032 *10 ** 18;
      }
      else if(now <= 1956527999) { // 12/31/2031 @ 11:59pm (UTC)
            return 51294580 *10 ** 18;
      }
      else if(now <= 1988150399) { // 12/31/2032 @ 11:59pm (UTC)
            return 52574631 *10 ** 18;
      }
      else if(now <= 2019686399) { // 12/31/2033 @ 11:59pm (UTC)
            return 53782475 *10 ** 18;
      }
      else if(now <= 2051222399) { // 12/31/2034 @ 11:59pm (UTC)
            return 54928714 *10 ** 18;
      }
      else if(now <= 2082758399) { // 12/31/2035 @ 11:59pm (UTC)
            return 56019326 *10 ** 18;
      }
      else if(now <= 2114380799) { // 12/31/2036 @ 11:59pm (UTC)
            return 57062248 *10 ** 18;
      }
      else if(now <= 2145916799) { // 12/31/2037 @ 11:59pm (UTC)
            return 58056255 *10 ** 18;
      }
      else if(now <= 2177452799) { // 12/31/2038 @ 11:59pm (UTC)
            return 59008160 *10 ** 18;
      }
      else if(now <= 2208988799) { // 12/31/2039 @ 11:59pm (UTC)
            return 59921387 *10 ** 18;
      }
      else if(now <= 2240611199) { // 12/31/2040 @ 11:59pm (UTC)
            return 60801313 *10 ** 18;
      }
      else if(now <= 2272147199) { // 12/31/2041 @ 11:59pm (UTC)
            return 61645817 *10 ** 18;
      }
      else if(now <= 2303683199) { // 12/31/2042 @ 11:59pm (UTC)
            return 62459738 *10 ** 18;
      }
      else if(now <= 2335219199) { // 12/31/2043 @ 11:59pm (UTC)
            return 63245214 *10 ** 18;
      }
      else if(now <= 2366841599) { // 12/31/2044 @ 11:59pm (UTC)
            return 64006212 *10 ** 18;
      }
      else if(now <= 2398377599) { // 12/31/2045 @ 11:59pm (UTC)
            return 64740308 *10 ** 18;
      }
      else if(now <= 2429913599) { // 12/31/2046 @ 11:59pm (UTC)
            return 65451186 *10 ** 18;
      }
      else if(now <= 2461449599) { // 12/31/2047 @ 11:59pm (UTC)
            return 66140270 *10 ** 18;
      }
      else if(now <= 2493071999) { // 12/31/2048 @ 11:59pm (UTC)
            return 66810661 *10 ** 18;
      }
      else if(now <= 2524607999) { // 12/31/2049 @ 11:59pm (UTC)
            return 67459883 *10 ** 18;
      }
      else if(now <= 2556143999) { // 12/31/2050 @ 11:59pm (UTC)
            return 68090879 *10 ** 18;
      }
      else if(now <= 2587679999) { // 12/31/2051 @ 11:59pm (UTC)
            return 68704644 *10 ** 18;
      }
      else if(now <= 2619302399) { // 12/31/2052 @ 11:59pm (UTC)
            return 69303710 *10 ** 18;
      }
      else if(now <= 2650838399) { // 12/31/2053 @ 11:59pm (UTC)
            return 69885650 *10 ** 18;
      }
      else if(now <= 2682374399) { // 12/31/2054 @ 11:59pm (UTC)
            return 70452903 *10 ** 18;
      }
      else if(now <= 2713910399) { // 12/31/2055 @ 11:59pm (UTC)
            return 71006193 *10 ** 18;
      }
      else if(now <= 2745532799) { // 12/31/2056 @ 11:59pm (UTC)
            return 71547652 *10 ** 18;
      }
      else if(now <= 2777068799) { // 12/31/2057 @ 11:59pm (UTC)
            return 72074946 *10 ** 18;
      }
      else if(now <= 2808604799) { // 12/31/2058 @ 11:59pm (UTC)
            return 72590155 *10 ** 18;
      }
      else if(now <= 2840140799) { // 12/31/2059 @ 11:59pm (UTC)
            return 73093818 *10 ** 18;
      }
      else if(now <= 2871763199) { // 12/31/2060 @ 11:59pm (UTC)
            return 73587778 *10 ** 18;
      }
      else if(now <= 2903299199) { // 12/31/2061 @ 11:59pm (UTC)
            return 74069809 *10 ** 18;
      }
      else if(now <= 2934835199) { // 12/31/2062 @ 11:59pm (UTC)
            return 74541721 *10 ** 18;
      }
      else if(now <= 2966371199) { // 12/31/2063 @ 11:59pm (UTC)
            return 75003928 *10 ** 18;
      }
      else if(now <= 2997993599) { // 12/31/2064 @ 11:59pm (UTC)
            return 75458050 *10 ** 18;
      }
      else if(now <= 3029529599) { // 12/31/2065 @ 11:59pm (UTC)
            return 75901975 *10 ** 18;
      }
      else if(now <= 3061065599) { // 12/31/2066 @ 11:59pm (UTC)
            return 76337302 *10 ** 18;
      }
      else if(now <= 3092601599) { // 12/31/2067 @ 11:59pm (UTC)
            return 76764358 *10 ** 18;
      }
      else if(now <= 3124223999) { // 12/31/2068 @ 11:59pm (UTC)
            return 77184590 *10 ** 18;
      }
      else if(now <= 3155759999) { // 12/31/2069 @ 11:59pm (UTC)
            return 77595992 *10 ** 18;
      }
      else if(now <= 3187295999) { // 12/31/2070 @ 11:59pm (UTC)
            return 78000000 *10 ** 18;
      }
    }
    else {

      return total_token_cap694;
    }
  }
}


                                              
contract VreneliumToken is MintableTokenWithCap {

    // Public Constants
    string public constant name143 = "Vrenelium Token";	//inject NONSTANDARD NAMING
    string public constant symbol618 = "VRE";	//inject NONSTANDARD NAMING
    uint8 public constant decimals508 = 18;	//inject NONSTANDARD NAMING

                                                                                
    modifier VALIDDESTINATION53(address _to) {	//inject NONSTANDARD NAMING
        require(_to != address(this));
        _;
    }

    constructor() public {
    }

    function TRANSFERFROM547(address _from, address _to, uint256 _value) public	//inject NONSTANDARD NAMING
        VALIDDESTINATION53(_to)
        returns (bool) {
        return super.TRANSFERFROM547(_from, _to, _value);
    }

    function APPROVE398(address _spender, uint256 _value) public	//inject NONSTANDARD NAMING
        returns (bool) {
        return super.APPROVE398(_spender, _value);
    }

    function INCREASEAPPROVAL521 (address _spender, uint _addedValue) public	//inject NONSTANDARD NAMING
        returns (bool) {
        return super.INCREASEAPPROVAL521(_spender, _addedValue);
    }

    function DECREASEAPPROVAL331 (address _spender, uint _subtractedValue) public	//inject NONSTANDARD NAMING
        returns (bool) {
        return super.DECREASEAPPROVAL331(_spender, _subtractedValue);
    }

    function TRANSFER705(address _to, uint256 _value) public	//inject NONSTANDARD NAMING
        VALIDDESTINATION53(_to)
        returns (bool) {
        return super.TRANSFER705(_to, _value);
    }
}