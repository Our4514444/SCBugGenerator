pragma solidity ^0.5.3 <0.6.0;



  contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED311(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED311(address(0), _owner);
    }

                                                        
    function OWNER617() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER84() {	//inject NONSTANDARD NAMING
        require(ISOWNER966());
        _;
    }

                                                                                 
    function ISOWNER966() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                               
    function RENOUNCEOWNERSHIP783() public ONLYOWNER84 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED311(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP238(address newOwner) public ONLYOWNER84 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP1(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP1(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED311(_owner, newOwner);
        _owner = newOwner;
    }
}

// https://github.com/OpenZeppelin/openzeppelin-solidity/blob/master/contracts/math/SafeMath.sol

                                                                                                   
library SafeMath {
                                                                                  
    function MUL330(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

                                                                                                                           
    function DIV168(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB202(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD984(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD94(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}
contract SimpleToken is Ownable {
    using SafeMath for uint256;

    event TRANSFER113(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    mapping (address => uint256) private _balances;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY55() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                              
    function BALANCEOF362(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                 
    function TRANSFER506(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER129(msg.sender, to, value);
        return true;
    }


                                                                                                                                                                                                                    
    function _TRANSFER129(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));
        require(value <= _balances[from]); // Check there is enough balance.

        _balances[from] = _balances[from].SUB202(value);
        _balances[to] = _balances[to].ADD984(value);
        emit TRANSFER113(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                              
    function _MINT3(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD984(value);
        _balances[account] = _balances[account].ADD984(value);
        emit TRANSFER113(address(0), account, value);
    }
}
contract FiatContract {
  function USD83(uint _id) public pure returns (uint256);	//inject NONSTANDARD NAMING
}

contract RealToken is Ownable, SimpleToken {
  FiatContract public price;
    
  using SafeMath for uint256;

  string public constant name130 = "DreamPot Token";	//inject NONSTANDARD NAMING
  string public constant symbol413 = "DPT";	//inject NONSTANDARD NAMING
  uint32 public constant decimals194 = 0;	//inject NONSTANDARD NAMING

  address payable public ethOwner;

  uint256 public factor;

  event GETETH234(address indexed from, uint256 value);	//inject NONSTANDARD NAMING

  constructor() public {
    price = FiatContract(0x8055d0504666e2B6942BeB8D6014c964658Ca591);
    ethOwner = address(uint160(OWNER617()));
    factor = 100;
  }

  function SETETHOWNER372(address newOwner) public ONLYOWNER84 {	//inject NONSTANDARD NAMING
    require(newOwner != address(0));
    ethOwner = address(uint160(newOwner));
  }

  function SETFACTOR512(uint256 newFactor) public ONLYOWNER84 {	//inject NONSTANDARD NAMING
    factor = newFactor;
  }
  
  // Calcs mint tokens
  function CALCTOKENS268(uint256 weivalue) public view returns(uint256) {	//inject NONSTANDARD NAMING
    uint256 ethCent = price.USD83(0);
    uint256 usdv = ethCent.DIV168(1000);
    usdv = usdv.MUL330(factor);
    return weivalue.DIV168(usdv);
  }

  function() external payable {
    uint256 tokens = CALCTOKENS268(msg.value);
    ethOwner.transfer(msg.value);
    emit GETETH234(msg.sender, msg.value);
    _MINT3(msg.sender, tokens);
  }
}