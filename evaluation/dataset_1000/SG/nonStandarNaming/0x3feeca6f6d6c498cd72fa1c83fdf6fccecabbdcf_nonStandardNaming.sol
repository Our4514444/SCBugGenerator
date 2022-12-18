pragma solidity ^0.5.2;

                                                                                   
interface IERC20 {
    function TRANSFER52(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE983(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM936(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY804() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF197(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE839(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

    event TRANSFER819(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL63(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}




//import "./IERC20.sol";
//import "../../math/SafeMath.sol";



                                                                                                   
library SafeMath {
                                                                                  
    function MUL16(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

                                                                                                                           
    function DIV109(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

                                                                                                                              
    function SUB813(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

                                                                            
    function ADD826(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

                                                                                                                                                    
    function MOD853(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

                                                               
    function TOTALSUPPLY804() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

                                                                                                                                                                                                             
    function BALANCEOF197(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }

                                                                                                                                                                                                                                                                                                                                    
    function ALLOWANCE839(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }

                                                                                                                                                                
    function TRANSFER52(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER17(msg.sender, to, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
    function APPROVE983(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE143(msg.sender, spender, value);
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
    function TRANSFERFROM936(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER17(from, to, value);
        _APPROVE143(from, msg.sender, _allowed[from][msg.sender].SUB813(value));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
    function INCREASEALLOWANCE157(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE143(msg.sender, spender, _allowed[msg.sender][spender].ADD826(addedValue));
        return true;
    }

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
    function DECREASEALLOWANCE949(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE143(msg.sender, spender, _allowed[msg.sender][spender].SUB813(subtractedValue));
        return true;
    }

                                                                                                                                                                                                                    
    function _TRANSFER17(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB813(value);
        _balances[to] = _balances[to].ADD826(value);
        emit TRANSFER819(from, to, value);
    }

                                                                                                                                                                                                                                                                                                                                                
    function _MINT782(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD826(value);
        _balances[account] = _balances[account].ADD826(value);
        emit TRANSFER819(address(0), account, value);
    }

                                                                                                                                                                                                                           
    function _BURN949(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB813(value);
        _balances[account] = _balances[account].SUB813(value);
        emit TRANSFER819(account, address(0), value);
    }

                                                                                                                                                                                                                                                                  
    function _APPROVE143(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL63(owner, spender, value);
    }

                                                                                                                                                                                                                                                                                                                                                                                              
    function _BURNFROM158(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN949(account, value);
        _APPROVE143(account, msg.sender, _allowed[account][msg.sender].SUB813(value));
    }
}



                                                                                                                                                                                             
contract Ownable {
    address private _owner;

    event OWNERSHIPTRANSFERRED957(address indexed previousOwner, address indexed newOwner);	//inject NONSTANDARD NAMING

                                                                                                                           
    constructor () internal {
        _owner = msg.sender;
        emit OWNERSHIPTRANSFERRED957(address(0), _owner);
    }

                                                        
    function OWNER360() public view returns (address) {	//inject NONSTANDARD NAMING
        return _owner;
    }

                                                                                 
    modifier ONLYOWNER698() {	//inject NONSTANDARD NAMING
        require(ISOWNER648());
        _;
    }

                                                                                 
    function ISOWNER648() public view returns (bool) {	//inject NONSTANDARD NAMING
        return msg.sender == _owner;
    }

                                                                                                                                                                                                                                                                                                                                                           
    function RENOUNCEOWNERSHIP984() public ONLYOWNER698 {	//inject NONSTANDARD NAMING
        emit OWNERSHIPTRANSFERRED957(_owner, address(0));
        _owner = address(0);
    }

                                                                                                                                                                    
    function TRANSFEROWNERSHIP809(address newOwner) public ONLYOWNER698 {	//inject NONSTANDARD NAMING
        _TRANSFEROWNERSHIP839(newOwner);
    }

                                                                                                                                         
    function _TRANSFEROWNERSHIP839(address newOwner) internal {	//inject NONSTANDARD NAMING
        require(newOwner != address(0));
        emit OWNERSHIPTRANSFERRED957(_owner, newOwner);
        _owner = newOwner;
    }
}


//import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "../node_modules/openzeppelin-solidity/contracts/ownership/Ownable.sol";

//import 'https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/master/contracts/token/ERC20/ERC20.sol';
//import 'https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-solidity/master/contracts/ownership/Ownable.sol';

contract Famecoin is ERC20, Ownable {
    
  string public name;
  string public symbol;
  uint32 public decimals;
  uint256 public _totalSupply;

  constructor() public {
      
    _totalSupply = 400000000000000000000000000;
    decimals = 18;
    symbol = "FMCO";
    name = "Famecoin";
    _MINT782(msg.sender, _totalSupply);
  }

  function BURNREMAINING276(uint256 _amount) external ONLYOWNER698 {	//inject NONSTANDARD NAMING
  	_BURN949(msg.sender, _amount);
  }

}