                                                                 

pragma solidity ^0.5.17;

interface IERC20 {
    function TOTALSUPPLY26() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF596(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER539(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE316(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE433(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM381(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER680(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL316(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
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
    function NAME201() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL251() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS999() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD473(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB910(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB910(a, b, "SafeMath: subtraction overflow");
    }
    function SUB910(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL929(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV654(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV654(a, b, "SafeMath: division by zero");
    }
    function DIV654(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT32(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
}

library SafeERC20 {
    using SafeMath for uint;
    using Address for address;

    function SAFETRANSFER439(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN475(token, abi.encodeWithSelector(token.TRANSFER539.selector, to, value));
    }

    function SAFETRANSFERFROM266(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN475(token, abi.encodeWithSelector(token.TRANSFERFROM381.selector, from, to, value));
    }

    function SAFEAPPROVE890(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE316(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN475(token, abi.encodeWithSelector(token.APPROVE433.selector, spender, value));
    }
    function CALLOPTIONALRETURN475(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT32(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

interface Oracle {
    function GETPRICEUSD212(address reserve) external view returns (uint);	//inject NONSTANDARD NAMING
}

contract SyntheticRebaseDollar is ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

    // Oracle used for price debt data (external to the AMM balance to avoid internal manipulation)
    Oracle public constant link482 = Oracle(0x271bf4568fb737cc2e6277e9B1EE0034098cDA2a);	//inject NONSTANDARD NAMING
    
    mapping (address => uint) public userCredit;
    // user => token => credit
    mapping (address => mapping(address => uint)) public credit;
    // user => token => balance
    mapping (address => mapping(address => uint)) public balances;
    // user => address[] markets (credit markets supplied to)
    mapping (address => address[]) public markets;
    address[] public market;
    mapping (address => bool) public exists;
    uint public constant base427 = 10000;	//inject NONSTANDARD NAMING
    
    constructor () public ERC20Detailed("Synthetic Rebase USD", "srUSD", 8) {}
    
    function FACTOR780() public view returns (uint) {	//inject NONSTANDARD NAMING
        uint _collateral = 0;
        for (uint i = 0; i < market.length; i++) {
            uint _value = IERC20(market[i]).BALANCEOF596(address(this));
            _collateral = _collateral.ADD473(link482.GETPRICEUSD212(market[i]).MUL929(_value).DIV654(uint256(10)**ERC20Detailed(market[i]).DECIMALS999()));
        }
        if (_collateral > 0) {
            return _totalSupply.MUL929(base427).DIV654(_collateral);
        }
        return base427;
    }
    
    function DEPOSITALL748(address token) external {	//inject NONSTANDARD NAMING
        DEPOSIT146(token, IERC20(token).BALANCEOF596(msg.sender));
    }
    
    function DEPOSIT146(address token, uint amount) public {	//inject NONSTANDARD NAMING
        _DEPOSIT542(token, amount);
    }
    
    function GETCREDIT717(address owner, address token) public view returns (uint) {	//inject NONSTANDARD NAMING
        return credit[owner][token].MUL929(FACTOR780()).DIV654(base427);
    }
    
    function _GETCREDIT931(address owner, address token, uint _factor) internal view returns (uint) {	//inject NONSTANDARD NAMING
        return credit[owner][token].MUL929(_factor).DIV654(base427);
    }
    
    function GETUSERCREDIT971(address owner) public view returns (uint) {	//inject NONSTANDARD NAMING
        return userCredit[owner].MUL929(FACTOR780()).DIV654(base427);
    }
    
    function _GETUSERCREDIT304(address owner, uint _factor) internal view returns (uint) {	//inject NONSTANDARD NAMING
        return userCredit[owner].MUL929(_factor).DIV654(base427);
    }
    
    function _DEPOSIT542(address token, uint amount) internal {	//inject NONSTANDARD NAMING
        uint _value = link482.GETPRICEUSD212(token).MUL929(amount).DIV654(uint256(10)**ERC20Detailed(token).DECIMALS999());
        require(_value > 0, "!value");
        
        IERC20(token).SAFETRANSFERFROM266(msg.sender, address(this), amount);

        // Assign collateral to the user
        balances[msg.sender][token] = balances[msg.sender][token].ADD473(amount);
        
        credit[msg.sender][token] = credit[msg.sender][token].ADD473(_value);
        userCredit[msg.sender] = userCredit[msg.sender].ADD473(_value);
        
        _MINT769(msg.sender, _value);
        
        markets[msg.sender].push(token);
        if (!exists[token]) {
            market.push(token);
            exists[token] = true;
        }
    }
    
    function WITHDRAWALL838(address token) external {	//inject NONSTANDARD NAMING
        _WITHDRAW452(token, IERC20(this).BALANCEOF596(msg.sender));
    }
    
    function WITHDRAW417(address token, uint amount) external {	//inject NONSTANDARD NAMING
        _WITHDRAW452(token, amount);
    }

    // UNSAFE: No slippage protection, should not be called directly
    function _WITHDRAW452(address token, uint amount) internal {	//inject NONSTANDARD NAMING
        
        uint _factor = FACTOR780(); // call once to minimize sub calls in getCredit and getUserCredit
        
        uint _credit = _GETCREDIT931(msg.sender, token, _factor);
        uint _token = balances[msg.sender][token];
        
        if (_credit < amount) {
            amount = _credit;
        }
        
        _BURN896(msg.sender, amount, _factor);
        credit[msg.sender][token] = _GETCREDIT931(msg.sender, token, _factor).SUB910(amount);
        userCredit[msg.sender] = _GETUSERCREDIT304(msg.sender, _factor).SUB910(amount);
        
        // Calculate % of collateral to release
        _token = _token.MUL929(amount).DIV654(_credit);
        
        IERC20(token).SAFETRANSFER439(msg.sender, _token);
        balances[msg.sender][token] = balances[msg.sender][token].SUB910(_token);
    }
    
    function GETMARKETS249(address owner) external view returns (address[] memory) {	//inject NONSTANDARD NAMING
        return markets[owner];
    }
    
    function ADJUSTED552(uint amount) external view returns (uint) {	//inject NONSTANDARD NAMING
        return amount = amount.MUL929(base427).DIV654(FACTOR780());
    }
    
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    
    function TOTALSUPPLY26() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply.MUL929(FACTOR780()).DIV654(base427);
    }
    function TOTALSUPPLYBASE145() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF596(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account].MUL929(FACTOR780()).DIV654(base427);
    }
    function BALANCEOFBASE93(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER539(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER568(msg.sender, recipient, amount.MUL929(base427).DIV654(FACTOR780()), amount);
        return true;
    }
    function ALLOWANCE316(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender].MUL929(FACTOR780()).DIV654(base427);
    }
    function _ALLOWANCE204(address owner, address spender, uint _factor) internal view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender].MUL929(_factor).DIV654(base427);
    }
    function APPROVE433(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE201(msg.sender, spender, amount.MUL929(base427).DIV654(FACTOR780()));
        return true;
    }
    function TRANSFERFROM381(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        uint _factor = FACTOR780();
        _TRANSFER568(sender, recipient, amount.MUL929(base427).DIV654(_factor), amount);
        _APPROVE201(sender, msg.sender, _ALLOWANCE204(sender, msg.sender, _factor).SUB910(amount.MUL929(base427).DIV654(_factor), "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE811(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint _factor = FACTOR780();
        _APPROVE201(msg.sender, spender, _ALLOWANCE204(msg.sender, spender, _factor).ADD473(addedValue.MUL929(base427).DIV654(_factor)));
        return true;
    }
    function DECREASEALLOWANCE900(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        uint _factor = FACTOR780();
        _APPROVE201(msg.sender, spender, _ALLOWANCE204(msg.sender, spender, _factor).SUB910(subtractedValue.MUL929(base427).DIV654(_factor), "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER568(address sender, address recipient, uint amount, uint sent) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].SUB910(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD473(amount);
        emit TRANSFER680(sender, recipient, sent);
    }
    function _MINT769(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");
        amount = amount.MUL929(base427).DIV654(FACTOR780());
        
        _totalSupply = _totalSupply.ADD473(amount);
        _balances[account] = _balances[account].ADD473(amount);
        emit TRANSFER680(address(0), account, amount);
    }
    function _BURN896(address account, uint amount, uint _factor) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");
        
        amount = amount.MUL929(base427).DIV654(_factor);
        
        _balances[account] = _balances[account].SUB910(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB910(amount);
        emit TRANSFER680(account, address(0), amount);
    }
    function _APPROVE201(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        
        _allowances[owner][spender] = amount;
        emit APPROVAL316(owner, spender, amount);
    }
}