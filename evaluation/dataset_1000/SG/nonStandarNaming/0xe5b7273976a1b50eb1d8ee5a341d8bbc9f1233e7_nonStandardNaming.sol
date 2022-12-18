pragma solidity ^0.5.7;

interface IERC20 {
    function TRANSFER402(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE290(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM274(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY433() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF761(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE196(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER9(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL541(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Ownable {
    address private _owner;
    event OWNERSHIPTRANSFERRED471(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED471(address(0), _owner);
    }
    function OWNER77() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }
    
    modifier ONLYOWNER765() {	//inject NONSTANDARD NAMING
        require(ISOWNER607());
        _;
    }
    
    function ISOWNER607() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }
    
    function RENOUNCEOWNERSHIP994() public ONLYOWNER765 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED471(_owner, address(0));
        _owner = address(0);
    }
    
    function TRANSFEROWNERSHIP421(address newOwner) public ONLYOWNER765 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP193(newOwner);
    }
   
    function _TRANSFEROWNERSHIP193(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED471(_owner, newOwner);
        _owner = newOwner;
    }
}


contract SafeMath {
  function SAFEMUL807(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function SAFEDIV540(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b > 0);
    uint256 c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function SAFESUB835(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function SAFEADD151(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c>=a && c>=b);
    return c;
  }

}

contract ERC20TOKEN is Ownable, SafeMath, IERC20{
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    event TRANSFER9(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL541(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
    constructor()  public  {
        balanceOf[msg.sender] = 1000000000000000000000000000;
        totalSupply = 1000000000000000000000000000;
        name = "DU";
        symbol = "DU";
        decimals = 18;
		
    }

    function TRANSFER402(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
        require(_to != address(0));
		require(_value > 0); 
        require(balanceOf[msg.sender] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);
		uint previousBalances = balanceOf[msg.sender] + balanceOf[_to];		
        balanceOf[msg.sender] = SafeMath.SAFESUB835(balanceOf[msg.sender], _value);
        balanceOf[_to] = SafeMath.SAFEADD151(balanceOf[_to], _value);
        emit TRANSFER9(msg.sender, _to, _value);
		assert(balanceOf[msg.sender]+balanceOf[_to]==previousBalances);
        return true;
    }

    function APPROVE290(address _spender, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
		require((_value == 0) || (allowance[msg.sender][_spender] == 0));
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL541(msg.sender, _spender, _value);
        return true;
    }

    function TRANSFERFROM274(address _from, address _to, uint256 _value) public returns (bool success) {	//inject NONSTANDARD NAMING
        require (_to != address(0));
		require (_value > 0); 
        require (balanceOf[_from] >= _value) ;
        require (balanceOf[_to] + _value > balanceOf[_to]);
        require (_value <= allowance[_from][msg.sender]);
        balanceOf[_from] = SafeMath.SAFESUB835(balanceOf[_from], _value);
        balanceOf[_to] = SafeMath.SAFEADD151(balanceOf[_to], _value);
        allowance[_from][msg.sender] = SafeMath.SAFESUB835(allowance[_from][msg.sender], _value);
        emit TRANSFER9(_from, _to, _value);
        return true;
    }
}