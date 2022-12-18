pragma solidity ^0.5.1;

library SafeMath {
  function MUL467(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function DIV28(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function SUB232(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    assert(b <= a);
    return a - b;
  }

  function ADD945(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

interface ERC20 {
  function BALANCEOF136(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFER386(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function ALLOWANCE69(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
  function TRANSFERFROM0(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  function APPROVE545(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
  event TRANSFER298(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
  event APPROVAL703(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

interface ERC223 {
    function TRANSFER386(address to, uint value, bytes calldata data ) external;	//inject NONSTANDARD NAMING
    event TRANSFER298(address indexed from, address indexed to, uint value, bytes indexed data);	//inject NONSTANDARD NAMING
}

contract ERC223ReceivingContract { 
    function TOKENFALLBACK902(address _from, uint _value, bytes memory _data) public;	//inject NONSTANDARD NAMING
}

contract VRC2 is ERC20, ERC223 {
  using SafeMath for uint;
     
    string internal _name;
    string internal _symbol;
    uint8 internal _decimals;
    uint256 internal _totalSupply;

    mapping (address => uint256) internal balances;
    mapping (address => mapping (address => uint256)) internal allowed;

    constructor(string memory name, string memory symbol, uint8 decimals, uint256 totalSupply) public {
        _symbol = symbol;
        _name = name;
        _decimals = decimals;
        _totalSupply = totalSupply;
        balances[msg.sender] = totalSupply;
    }

    function NAME419()	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory) {
        return _name;
    }

    function SYMBOL991()	//inject NONSTANDARD NAMING
        public
        view
        returns (string memory) {
        return _symbol;
    }

    function DECIMALS651()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint8) {
        return _decimals;
    }

    function TOTALSUPPLY10()	//inject NONSTANDARD NAMING
        public
        view
        returns (uint256) {
        return _totalSupply;
    }

   function TRANSFER386(address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
     require(_to != address(0));
     require(_value <= balances[msg.sender]);
     balances[msg.sender] = SafeMath.SUB232(balances[msg.sender], _value);
     balances[_to] = SafeMath.ADD945(balances[_to], _value);
     emit TRANSFER298(msg.sender, _to, _value);
     return true;
   }

  function BALANCEOF136(address _owner) public view returns (uint256 balance) {	//inject NONSTANDARD NAMING
    return balances[_owner];
   }

  function TRANSFERFROM0(address _from, address _to, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
    require(_to != address(0));
     require(_value <= balances[_from]);
     require(_value <= allowed[_from][msg.sender]);

    balances[_from] = SafeMath.SUB232(balances[_from], _value);
     balances[_to] = SafeMath.ADD945(balances[_to], _value);
     allowed[_from][msg.sender] = SafeMath.SUB232(allowed[_from][msg.sender], _value);
     emit TRANSFER298(_from, _to, _value);
     return true;
   }

   function APPROVE545(address _spender, uint256 _value) public returns (bool) {	//inject NONSTANDARD NAMING
     allowed[msg.sender][_spender] = _value;
     emit APPROVAL703(msg.sender, _spender, _value);
     return true;
   }

  function ALLOWANCE69(address _owner, address _spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
     return allowed[_owner][_spender];
   }

   function INCREASEAPPROVAL859(address _spender, uint _addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
     allowed[msg.sender][_spender] = SafeMath.ADD945(allowed[msg.sender][_spender], _addedValue);
     emit APPROVAL703(msg.sender, _spender, allowed[msg.sender][_spender]);
     return true;
   }

  function DECREASEAPPROVAL345(address _spender, uint _subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
     uint oldValue = allowed[msg.sender][_spender];
     if (_subtractedValue > oldValue) {
       allowed[msg.sender][_spender] = 0;
     } else {
       allowed[msg.sender][_spender] = SafeMath.SUB232(oldValue, _subtractedValue);
    }
     emit APPROVAL703(msg.sender, _spender, allowed[msg.sender][_spender]);
     return true;
   }
   
  function TRANSFER386(address _to, uint _value, bytes memory _data) public {	//inject NONSTANDARD NAMING
    require(_value > 0 );
    if(ISCONTRACT729(_to)) {
        ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
        receiver.TOKENFALLBACK902(msg.sender, _value, _data);
    }
        balances[msg.sender] = balances[msg.sender].SUB232(_value);
        balances[_to] = balances[_to].ADD945(_value);
        emit TRANSFER298(msg.sender, _to, _value, _data);
    }
    
  function ISCONTRACT729(address _addr) private returns (bool is_contract) {	//inject NONSTANDARD NAMING
      uint length;
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
      }
      return (length>0);
    }
}