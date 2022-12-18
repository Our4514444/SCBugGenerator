                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
	function TOTALSUPPLY982() external view returns (uint256);	//inject NONSTANDARD NAMING
	function BALANCEOF155(address who) external view returns (uint256);	//inject NONSTANDARD NAMING
	function TRANSFER634(address to, uint256 value) external returns (bool);		//inject NONSTANDARD NAMING
	function ALLOWANCE66(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
	function APPROVE108(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
	function TRANSFERFROM635(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING
	event TRANSFER217(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
	event APPROVAL544(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

library SafeMath {
	function ADD844(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }
    
	function SUB256(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		return SUB256(a, b, "SafeMath: subtraction overflow");
    }
    
	function SUB256(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;
        return c;
    }
    
	function MUL199(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }
		
		uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");
        return c;
    }
    
	function DIV991(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV991(a, b, "SafeMath: division by zero");
    }
    
	function DIV991(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;
        return c;
    }

	function CEIL766(uint256 a, uint256 m) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
		uint256 c = ADD844(a,m);
		uint256 d = SUB256(c,1);
		return MUL199(DIV991(d,m),m);
	}	
}

library Address {
	function ISCONTRACT255(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
		bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != accountHash && codehash != 0x0);
    }
	
	function TOPAYABLE905(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
		return address(uint160(account));
    }
    
	function SENDVALUE441(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-low-level-calls, avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

contract Context {
	constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER473() internal view returns (address payable) {	//inject NONSTANDARD NAMING
		return msg.sender;
    }

    function _MSGDATA634() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
		this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract ERC20Detailed is IERC20 {
	string private _name;
	string private _symbol;
	uint8 private _decimals;

	constructor(string memory name, string memory symbol, uint8 decimals) public {
		_name = name;
		_symbol = symbol;
		_decimals = decimals;
	}

	function NAME544() public view returns(string memory) {	//inject NONSTANDARD NAMING
		return _name;
	}

	function SYMBOL16() public view returns(string memory) {	//inject NONSTANDARD NAMING
		return _symbol;
	}

	function DECIMALS402() public view returns(uint8) {	//inject NONSTANDARD NAMING
		return _decimals;
	}
}

contract GEMY is ERC20Detailed, Context {
	using SafeMath for uint256;
	using Address for address;
	
	mapping (address => uint256) private _balances;
	mapping (address => mapping (address => uint256)) private _allowed;
	
	string constant tokenname401 = "GEMY";	//inject NONSTANDARD NAMING
	string constant tokensymbol508 = "GEMY";	//inject NONSTANDARD NAMING
	uint8  constant tokendecimals684 = 18;	//inject NONSTANDARD NAMING
	uint256 private _totalSupply = 1000000 * (10 ** 18);
	uint256 public basePercent = 150;
	
	constructor() public payable ERC20Detailed(tokenname401, tokensymbol508, tokendecimals684) {
        _MINT860(msg.sender, _totalSupply);
	}	

	function TOTALSUPPLY982() public view returns (uint256) {	//inject NONSTANDARD NAMING
		return _totalSupply;
	}

	function BALANCEOF155(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return _balances[owner];
	}
	
	function TRANSFER634(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER486(_MSGSENDER473(), to, value);
        return true;
    }
    
	function ALLOWANCE66(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
		return _allowed[owner][spender];
	}
	
	function APPROVE108(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE787(_MSGSENDER473(), spender, value);
        return true;
    }
	
	function TRANSFERFROM635(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER486(from, to, value);
        _APPROVE787(from, _MSGSENDER473(), _allowed[from][_MSGSENDER473()].SUB256(value, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
	
	function INCREASEALLOWANCE968(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE787(_MSGSENDER473(), spender, _allowed[_MSGSENDER473()][spender].ADD844(addedValue));
        return true;
    }
    
	function DECREASEALLOWANCE638(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE787(_MSGSENDER473(), spender, _allowed[_MSGSENDER473()][spender].SUB256(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    	
	function _TRANSFER486(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
		
		uint256 tokensToCut = CUT521(value);
		uint256 tokensToTransfer = value.SUB256(tokensToCut);
		uint256 tokensToDist = tokensToCut.MUL199(14).DIV991(15);
		uint256 tokensToBurn = tokensToCut.DIV991(15);
		
        _balances[from] = _balances[from].SUB256(value, "ERC20: transfer amount exceeds balance");
        _balances[to] = _balances[to].ADD844(tokensToTransfer);
		_balances[0x8176DdfcCBc9a05756AE57F1bCE72af241ddE510] = _balances[0x8176DdfcCBc9a05756AE57F1bCE72af241ddE510].ADD844(tokensToDist);
		
		_totalSupply = _totalSupply.SUB256(tokensToBurn);
		
        emit TRANSFER217(from, to, tokensToTransfer);
		emit TRANSFER217(from, 0x8176DdfcCBc9a05756AE57F1bCE72af241ddE510, tokensToDist);
		emit TRANSFER217(from, address(0), tokensToBurn);
    }		
	
	function MULTITRANSFER810(address[] memory receivers, uint256[] memory amounts) public {	//inject NONSTANDARD NAMING
		for (uint256 i = 0; i < receivers.length; i++) {
			TRANSFER634(receivers[i], amounts[i]);
		}
	}
    
	function _MINT860(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        _balances[account] = _balances[account].ADD844(amount);
        emit TRANSFER217(address(0), account, amount);
    }	
	
	function _BURN677(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
		require(account != address(0), "ERC20: burn from the zero address");
		require(amount <= _balances[account]);
		_balances[account] = _balances[account].SUB256(amount);		
		_totalSupply = _totalSupply.SUB256(amount);	
		emit TRANSFER217(account, address(0), amount);
	}
    
	function BURN358(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN677(_MSGSENDER473(), amount);
    }  	

	function _APPROVE787(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowed[owner][spender] = value;
        emit APPROVAL544(owner, spender, value);
    }

	function CUT521(uint256 value) public view returns (uint256)  {	//inject NONSTANDARD NAMING
		uint256 cutValue = value.MUL199(basePercent).DIV991(1000);
		return cutValue;
	}	
}