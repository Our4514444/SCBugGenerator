                                                                 

// SPDX-License-Identifier: MIT

                                                                                                                                   

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY547() external view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF891(address account) external view returns (uint);	//inject NONSTANDARD NAMING
    function TRANSFER967(address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE543(address owner, address spender) external view returns (uint);	//inject NONSTANDARD NAMING
    function APPROVE697(address spender, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM910(address sender, address recipient, uint amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER985(address indexed from, address indexed to, uint value);	//inject NONSTANDARD NAMING
    event APPROVAL754(address indexed owner, address indexed spender, uint value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER515() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function TOTALSUPPLY547() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF891(address account) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER967(address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER415(_MSGSENDER515(), recipient, amount);
        return true;
    }
    function ALLOWANCE543(address owner, address spender) public view returns (uint) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE697(address spender, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE190(_MSGSENDER515(), spender, amount);
        return true;
    }
    function TRANSFERFROM910(address sender, address recipient, uint amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER415(sender, recipient, amount);
        _APPROVE190(sender, _MSGSENDER515(), _allowances[sender][_MSGSENDER515()].SUB844(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE887(address spender, uint addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE190(_MSGSENDER515(), spender, _allowances[_MSGSENDER515()][spender].ADD38(addedValue));
        return true;
    }
    function DECREASEALLOWANCE234(address spender, uint subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE190(_MSGSENDER515(), spender, _allowances[_MSGSENDER515()][spender].SUB844(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER415(address sender, address recipient, uint amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB844(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD38(amount);
        emit TRANSFER985(sender, recipient, amount);
    }
    function _MINT701(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD38(amount);
        _balances[account] = _balances[account].ADD38(amount);
        emit TRANSFER985(address(0), account, amount);
    }
    function _BURN627(address account, uint amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB844(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB844(amount);
        emit TRANSFER985(account, address(0), amount);
    }
    function _APPROVE190(address owner, address spender, uint amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL754(owner, spender, amount);
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
    function NAME398() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _name;
    }
    function SYMBOL262() public view returns (string memory) {	//inject NONSTANDARD NAMING
        return _symbol;
    }
    function DECIMALS732() public view returns (uint8) {	//inject NONSTANDARD NAMING
        return _decimals;
    }
}

library SafeMath {
    function ADD38(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB844(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return SUB844(a, b, "SafeMath: subtraction overflow");
    }
    function SUB844(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function MUL686(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV288(uint a, uint b) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        return DIV288(a, b, "SafeMath: division by zero");
    }
    function DIV288(uint a, uint b, string memory errorMessage) internal pure returns (uint) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function ISCONTRACT85(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
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

    function SAFETRANSFER255(IERC20 token, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN686(token, abi.encodeWithSelector(token.TRANSFER967.selector, to, value));
    }

    function SAFETRANSFERFROM259(IERC20 token, address from, address to, uint value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN686(token, abi.encodeWithSelector(token.TRANSFERFROM910.selector, from, to, value));
    }

    function SAFEAPPROVE690(IERC20 token, address spender, uint value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE543(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN686(token, abi.encodeWithSelector(token.APPROVE697.selector, spender, value));
    }
    function CALLOPTIONALRETURN686(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT85(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract JJJ is ERC20, ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

    uint256 maxQuantity = 21000000 * 1e18; 
    address public governance;
    mapping (address => bool) public minters;

    constructor () public ERC20Detailed("JJJ Finance", "JJJ", 18) {
        governance = msg.sender;
    }

    function MINT947(address account, uint256 amount) public {	//inject NONSTANDARD NAMING
     require(minters[msg.sender], "!minter");
	 require(TOTALSUPPLY547() < maxQuantity, "Max TotalSupply 21000000");

	  uint256 finalAmount = amount;

        if (TOTALSUPPLY547().ADD38(amount) > maxQuantity) {
            finalAmount = maxQuantity.SUB844(TOTALSUPPLY547());
        }

        _MINT701(account, amount);
    }

    function BURN573(uint256 amount) public {	//inject NONSTANDARD NAMING
        _BURN627(msg.sender, amount);
    }

    function SETGOVERNANCE314(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    function ADDMINTER182(address _minter) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        minters[_minter] = true;
    }

    function REMOVEMINTER177(address _minter) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        minters[_minter] = false;
    }
}