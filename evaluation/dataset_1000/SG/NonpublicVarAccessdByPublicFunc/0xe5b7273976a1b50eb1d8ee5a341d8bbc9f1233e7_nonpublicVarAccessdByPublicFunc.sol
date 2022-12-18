pragma solidity ^0.5.7;

interface IERC20 {
    function transfer(address to, uint256 value) external returns (bool);

    function approve(address spender, uint256 value) external returns (bool);

    function transferFrom(address from, address to, uint256 value) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address who) external view returns (uint256);

    function allowance(address owner, address spender) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract Ownable {
    address private _owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () internal {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }
    function owner() public view returns (address) {
        return _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    modifier onlyOwner() {
        require(isOwner());
        _;
    }
    
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function renounceOwnership() public onlyOwner {
        emit OwnershipTransferred(_owner, address(0));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        _owner = address(0);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
    
    function transferOwnership(address newOwner) public onlyOwner {
        _transferOwnership(newOwner);
    }
   
    function _transferOwnership(address newOwner) internal {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}


contract SafeMath {
  function safeMul(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function safeDiv(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b > 0);
    uint256 c = a / b;
    assert(a == b * c + a % b);
    return c;
  }

  function safeSub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint256 a, uint256 b) internal pure returns (uint256) {
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

    mapping (address => uint256) internal balanceOf;
    mapping (address => mapping (address => uint256)) internal allowance;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    constructor()  public  {
        balanceOf[msg.sender] = 1000000000000000000000000000;
        totalSupply = 1000000000000000000000000000;
        name = "DU";
        symbol = "DU";
        decimals = 18;
		
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
		require(_value > 0); 
        require(balanceOf[msg.sender] >= _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require(balanceOf[_to] + _value >= balanceOf[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
		uint previousBalances = balanceOf[msg.sender] + balanceOf[_to];			//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[msg.sender] = SafeMath.safeSub(balanceOf[msg.sender], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(msg.sender, _to, _value);
		assert(balanceOf[msg.sender]+balanceOf[_to]==previousBalances);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
		require((_value == 0) || (allowance[msg.sender][_spender] == 0));	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowance[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require (_to != address(0));
		require (_value > 0); 
        require (balanceOf[_from] >= _value) ;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require (balanceOf[_to] + _value > balanceOf[_to]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        require (_value <= allowance[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_from] = SafeMath.safeSub(balanceOf[_from], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balanceOf[_to] = SafeMath.safeAdd(balanceOf[_to], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        allowance[_from][msg.sender] = SafeMath.safeSub(allowance[_from][msg.sender], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(_from, _to, _value);
        return true;
    }
}