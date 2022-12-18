pragma solidity ^0.5.2;

interface IERC20 {
	function TRANSFER374(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

	function APPROVE498(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

	function TRANSFERFROM813(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

	function TOTALSUPPLY550() external view returns (uint256);	//inject NONSTANDARD NAMING

	function BALANCEOF232(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

	function ALLOWANCE427(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING

	event TRANSFER372(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

	event APPROVAL201(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}
                                                                                                   
library SafeMath {
	                                                                              
	function MUL435(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
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

	                                                                                                                       
	function DIV376(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		// Solidity only automatically asserts when dividing by 0
		require(b > 0);
		uint256 c = a / b;
		// assert(a == b * c + a % b); // There is no case in which this doesn't hold

		return c;
	}

	                                                                                                                          
	function SUB412(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		require(b <= a);
		uint256 c = a - b;

		return c;
	}

	                                                                        
	function ADD309(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 c = a + b;
		require(c >= a);

		return c;
	}

	                                                                                                                                                
	function MOD147(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		require(b != 0);
		return a % b;
	}
}

                                                                                                                                                                                                                                        
contract ERC20Detailed is IERC20 {
	string private _name;
	string private _symbol;
	uint8 private _decimals;

	constructor (string memory name, string memory symbol, uint8 decimals) public {
		_name = name;
		_symbol = symbol;
		_decimals = decimals;
	}

	                                                 
	function NAME780() public view returns (string memory) {	//inject NONSTANDARD NAMING
		return _name;
	}

	                                                   
	function SYMBOL154() public view returns (string memory) {	//inject NONSTANDARD NAMING
		return _symbol;
	}

	                                                               
	function DECIMALS306() public view returns (uint8) {	//inject NONSTANDARD NAMING
		return _decimals;
	}
}

contract ERC20 is IERC20 {
	using SafeMath for uint256;

	mapping (address => uint256) private _balances;

	mapping (address => mapping (address => uint256)) private _allowed;

	uint256 private _totalSupply;

	                                                           
	function TOTALSUPPLY550() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return _totalSupply;
	}

	                                                                                                                                                                                                         
	function BALANCEOF232(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return _balances[owner];
	}

	                                                                                                                                                                                                                                                                                                                                
	function ALLOWANCE427(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return _allowed[owner][spender];
	}

	                                                                                                                                                            
	function TRANSFER374(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
		_TRANSFER277(msg.sender, to, value);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	function APPROVE498(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
		_APPROVE568(msg.sender, spender, value);
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	function TRANSFERFROM813(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
		_TRANSFER277(from, to, value);
		_APPROVE568(from, msg.sender, _allowed[from][msg.sender].SUB412(value));
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
	function INCREASEALLOWANCE962(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
		_APPROVE568(msg.sender, spender, _allowed[msg.sender][spender].ADD309(addedValue));
		return true;
	}

	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
	function DECREASEALLOWANCE206(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
		_APPROVE568(msg.sender, spender, _allowed[msg.sender][spender].SUB412(subtractedValue));
		return true;
	}

	                                                                                                                                                                                                                
	function _TRANSFER277(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
		require(to != address(0));

		_balances[from] = _balances[from].SUB412(value);
		_balances[to] = _balances[to].ADD309(value);
		emit TRANSFER372(from, to, value);
	}

	                                                                                                                                                                                                                                                                                                                                            
	function _MINT329(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		require(account != address(0));

		_totalSupply = _totalSupply.ADD309(value);
		_balances[account] = _balances[account].ADD309(value);
		emit TRANSFER372(address(0), account, value);
	}

	                                                                                                                                                                                                                       
	function _BURN734(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		require(account != address(0));

		_totalSupply = _totalSupply.SUB412(value);
		_balances[account] = _balances[account].SUB412(value);
		emit TRANSFER372(account, address(0), value);
	}

	                                                                                                                                                                                                                                                              
	function _APPROVE568(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
		require(spender != address(0));
		require(owner != address(0));

		_allowed[owner][spender] = value;
		emit APPROVAL201(owner, spender, value);
	}

	                                                                                                                                                                                                                                                                                                                                                                                          
	function _BURNFROM505(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
		_BURN734(account, value);
		_APPROVE568(account, msg.sender, _allowed[account][msg.sender].SUB412(value));
	}
}

pragma solidity ^0.5.0;

contract CryptoMarketAdsToken is ERC20, ERC20Detailed {

	uint256 private INITIAL_SUPPLY = 10000000000e18;
	constructor () public
	ERC20Detailed("CryptoMarketAdsToken", "CMA", 18)
	{
		_MINT329(msg.sender, INITIAL_SUPPLY);
	}
}