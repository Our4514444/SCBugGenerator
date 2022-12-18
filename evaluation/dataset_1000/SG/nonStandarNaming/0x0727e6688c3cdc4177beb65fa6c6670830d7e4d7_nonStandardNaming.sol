                                                                 

pragma solidity ^0.5.15;

contract  ERC20 {
    
    function TOTALSUPPLY131() external view returns (uint256 _totalSupply);	//inject NONSTANDARD NAMING
    function BALANCEOF725(address addr_) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER389(address _to, uint256 _value) external  returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM74(address from_, address to_, uint256 _value) external  returns (bool);	//inject NONSTANDARD NAMING
    function APPROVE601(address spender_, uint256 value_) external  returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE599(address _owner, address _spender) external  returns (uint256 remaining);	//inject NONSTANDARD NAMING
    event TRANSFER451(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL161(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING
}


library SafeMath {
  function MUL641(uint256 a, uint256 b) internal  returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a * b;
    assert(a == 0 || c / a == b);
    return c;
  }

  function DIV55(uint256 a, uint256 b) internal  returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SUB617(uint256 a, uint256 b) internal  returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }
  
  function SUB617(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

  function ADD48(uint256 a, uint256 b) internal  returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract STARGRAMToken is ERC20 {
    
    using SafeMath for uint256;
    string public constant symbol864 = "STARGRAM";	//inject NONSTANDARD NAMING
    string public constant name757 = "STARGRAM TOKEN";	//inject NONSTANDARD NAMING
    uint256 public constant decimals466 = 8;	//inject NONSTANDARD NAMING
    address owner;
    
    
    event TRANSFER451(address indexed _from, address indexed _to, uint256 _value);	//inject NONSTANDARD NAMING
    event APPROVAL161(address indexed _owner, address indexed _spender, uint256 _value);	//inject NONSTANDARD NAMING

    
    uint256 private constant totalsupply_768 = 400000000000000000;	//inject NONSTANDARD NAMING
    
    
    mapping(address => uint256) private balanceof_;
    mapping(address => mapping(address => uint256)) private allowance_;
    
    constructor() public{
        
        balanceof_[msg.sender] = totalsupply_768;
        owner = msg.sender;
    }
    
    function _TRANSFER600(address sender, address recipient, uint256 amount) internal  {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        balanceof_[sender] = balanceof_[sender].SUB617(amount, "ERC20: transfer amount exceeds balance");
        balanceof_[recipient] = balanceof_[recipient].ADD48(amount);
        emit TRANSFER451(sender, recipient, amount);
    }
    
    function TOTALSUPPLY131() external view returns(uint256){	//inject NONSTANDARD NAMING
        return totalsupply_768;
    }
    

    function BALANCEOF725(address addr_) external view returns(uint256){	//inject NONSTANDARD NAMING
       return balanceof_[addr_];
        
    }

    
    function TRANSFER389(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING

        _TRANSFER600(msg.sender, _to, _value);
        return true;
    }

    function TRANSFERFROM74(address from_, address to_, uint256 _value) external  returns (bool){	//inject NONSTANDARD NAMING
       
        require(_value <= balanceof_[from_]);
        require(_value <= allowance_[from_][msg.sender]);
        require(to_ != address(0));

        balanceof_[from_] =balanceof_[from_].SUB617(_value);
        allowance_[from_][msg.sender] = allowance_[from_][msg.sender].SUB617(_value);
        balanceof_[to_] =balanceof_[to_].ADD48(_value);
        emit TRANSFER451(from_, to_, _value);

        return true;
    }

    
    function APPROVE601(address spender_, uint256 value_) external  returns (bool){	//inject NONSTANDARD NAMING
        
        require(spender_ != address(0));

        bool status = false;

        if(balanceof_[msg.sender] >= value_){
            allowance_[msg.sender][spender_] = value_;
            emit APPROVAL161(msg.sender, spender_, value_);
            status = true;
        }
        return status;
    }

    function ALLOWANCE599(address _owner, address _spender) external  returns (uint256 remaining) {	//inject NONSTANDARD NAMING
        return allowance_[_owner][_spender];
        
    }

    
}