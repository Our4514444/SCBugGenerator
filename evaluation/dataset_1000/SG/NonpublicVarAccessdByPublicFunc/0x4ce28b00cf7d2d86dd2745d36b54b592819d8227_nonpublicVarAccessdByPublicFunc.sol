pragma solidity ^0.5.1;

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

interface ERC20 {
  function balanceOf(address who) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function allowance(address owner, address spender) external view returns (uint256);
  function transferFrom(address from, address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface ERC223 {
    function transfer(address to, uint value, bytes calldata data ) external;
    event Transfer(address indexed from, address indexed to, uint value, bytes indexed data);
}

contract ERC223ReceivingContract { 
    function tokenFallback(address _from, uint _value, bytes memory _data) public;
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

    function name()
        public
        view
        returns (string memory) {
        return _name;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function symbol()
        public
        view
        returns (string memory) {
        return _symbol;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function decimals()
        public
        view
        returns (uint8) {
        return _decimals;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

    function totalSupply()
        public
        view
        returns (uint256) {
        return _totalSupply;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }

   function transfer(address _to, uint256 _value) public returns (bool) {
     require(_to != address(0));
     require(_value <= balances[msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     balances[msg.sender] = SafeMath.sub(balances[msg.sender], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     balances[_to] = SafeMath.add(balances[_to], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     emit Transfer(msg.sender, _to, _value);
     return true;
   }

  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
   }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
     require(_value <= balances[_from]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     require(_value <= allowed[_from][msg.sender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC

    balances[_from] = SafeMath.sub(balances[_from], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     balances[_to] = SafeMath.add(balances[_to], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     allowed[_from][msg.sender] = SafeMath.sub(allowed[_from][msg.sender], _value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     emit Transfer(_from, _to, _value);
     return true;
   }

   function approve(address _spender, uint256 _value) public returns (bool) {
     allowed[msg.sender][_spender] = _value;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     emit Approval(msg.sender, _spender, _value);
     return true;
   }

  function allowance(address _owner, address _spender) public view returns (uint256) {
     return allowed[_owner][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
   }

   function increaseApproval(address _spender, uint _addedValue) public returns (bool) {
     allowed[msg.sender][_spender] = SafeMath.add(allowed[msg.sender][_spender], _addedValue);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     return true;
   }

  function decreaseApproval(address _spender, uint _subtractedValue) public returns (bool) {
     uint oldValue = allowed[msg.sender][_spender];	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     if (_subtractedValue > oldValue) {
       allowed[msg.sender][_spender] = 0;	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     } else {
       allowed[msg.sender][_spender] = SafeMath.sub(oldValue, _subtractedValue);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
    }
     emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
     return true;
   }
   
  function transfer(address _to, uint _value, bytes memory _data) public {
    require(_value > 0 );
    if(isContract(_to)) {
        ERC223ReceivingContract receiver = ERC223ReceivingContract(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
    }
        balances[msg.sender] = balances[msg.sender].sub(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        balances[_to] = balances[_to].add(_value);	//inject NONPUBLIC VAR ACCESSD BY PUBLIC FUNC
        emit Transfer(msg.sender, _to, _value, _data);
    }
    
  function isContract(address _addr) private returns (bool is_contract) {
      uint length;
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
      }
      return (length>0);
    }
}