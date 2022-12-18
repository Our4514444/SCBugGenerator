pragma solidity ^0.5.2;




interface IERC20 {
    function TRANSFER774(address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function APPROVE51(address spender, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM407(address from, address to, uint256 value) external returns (bool);	//inject NONSTANDARD NAMING

    function TOTALSUPPLY638() external view returns (uint256);	//inject NONSTANDARD NAMING

    function BALANCEOF731(address who) external view returns (uint256);	//inject NONSTANDARD NAMING

    function ALLOWANCE231(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    
    event TRANSFER627(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING

    event APPROVAL110(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
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

    function NAME433() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL398() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS950() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

























library SafeMath {

    function MUL367(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    function DIV456(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b > 0);
        uint256 c = a / b;
        return c;
    }


    function SUB0(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    function ADD17(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    function MOD660(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0);
        return a % b;
    }
}









contract ERC20 is IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowed;

    uint256 private _totalSupply;

    function TOTALSUPPLY638() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF731(address owner) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[owner];
    }
    function ALLOWANCE231(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowed[owner][spender];
    }
    function TRANSFER774(address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER677(msg.sender, to, value);
        return true;
    }
    function APPROVE51(address spender, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE785(msg.sender, spender, value);
        return true;
    }
    function TRANSFERFROM407(address from, address to, uint256 value) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER677(from, to, value);
        _APPROVE785(from, msg.sender, _allowed[from][msg.sender].SUB0(value));
        return true;
    }
    function INCREASEALLOWANCE515(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE785(msg.sender, spender, _allowed[msg.sender][spender].ADD17(addedValue));
        return true;
    }
    function DECREASEALLOWANCE761(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE785(msg.sender, spender, _allowed[msg.sender][spender].SUB0(subtractedValue));
        return true;
    }
    function _TRANSFER677(address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(to != address(0));

        _balances[from] = _balances[from].SUB0(value);
        _balances[to] = _balances[to].ADD17(value);
        emit TRANSFER627(from, to, value);
    }
    function _MINT36(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.ADD17(value);
        _balances[account] = _balances[account].ADD17(value);
        emit TRANSFER627(address(0), account, value);
    }
    function _BURN937(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(account != address(0));

        _totalSupply = _totalSupply.SUB0(value);
        _balances[account] = _balances[account].SUB0(value);
        emit TRANSFER627(account, address(0), value);
    }
    function _APPROVE785(address owner, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit APPROVAL110(owner, spender, value);
    }
    function _BURNFROM159(address account, uint256 value) internal {	//inject NONSTANDARD NAMING
        _BURN937(account, value);
        _APPROVE785(account, msg.sender, _allowed[account][msg.sender].SUB0(value));
    }
}











contract ERC20Burnable is ERC20 {

    function BURN219(uint256 value) public {	//inject NONSTANDARD NAMING
        _BURN937(msg.sender, value);
    }

    function BURNFROM659(address from, uint256 value) public {	//inject NONSTANDARD NAMING
        _BURNFROM159(from, value);
    }
}










contract SimpleToken is ERC20, ERC20Detailed {
    uint8 public constant decimals50 = 18;	//inject NONSTANDARD NAMING
    uint256 public constant initial_supply695 = 1000000000 * (10 ** uint256(decimals50));	//inject NONSTANDARD NAMING

    constructor () public ERC20Detailed("Infinity", "NITY", decimals50) {
        _MINT36(msg.sender, initial_supply695);
    }
}