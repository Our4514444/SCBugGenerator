                                                                 

pragma solidity ^0.5.16;

interface IERC20 {
    function TOTALSUPPLY896() external view returns (uint256);	//inject NONSTANDARD NAMING
    function BALANCEOF938(address account) external view returns (uint256);	//inject NONSTANDARD NAMING
    function TRANSFER700(address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function ALLOWANCE581(address owner, address spender) external view returns (uint256);	//inject NONSTANDARD NAMING
    function APPROVE151(address spender, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    function TRANSFERFROM599(address sender, address recipient, uint256 amount) external returns (bool);	//inject NONSTANDARD NAMING
    event TRANSFER83(address indexed from, address indexed to, uint256 value);	//inject NONSTANDARD NAMING
    event APPROVAL666(address indexed owner, address indexed spender, uint256 value);	//inject NONSTANDARD NAMING
}

contract Context {
    constructor () internal { }
    // solhint-disable-previous-line no-empty-blocks

    function _MSGSENDER291() internal view returns (address payable) {	//inject NONSTANDARD NAMING
        return msg.sender;
    }

    function _MSGDATA673() internal view returns (bytes memory) {	//inject NONSTANDARD NAMING
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;

    mapping (address => mapping (address => uint256)) private _allowances;

    uint256 private _totalSupply;
    function TOTALSUPPLY896() public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _totalSupply;
    }
    function BALANCEOF938(address account) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _balances[account];
    }
    function TRANSFER700(address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER774(_MSGSENDER291(), recipient, amount);
        return true;
    }
    function ALLOWANCE581(address owner, address spender) public view returns (uint256) {	//inject NONSTANDARD NAMING
        return _allowances[owner][spender];
    }
    function APPROVE151(address spender, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE530(_MSGSENDER291(), spender, amount);
        return true;
    }
    function TRANSFERFROM599(address sender, address recipient, uint256 amount) public returns (bool) {	//inject NONSTANDARD NAMING
        _TRANSFER774(sender, recipient, amount);
        _APPROVE530(sender, _MSGSENDER291(), _allowances[sender][_MSGSENDER291()].SUB330(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
    function INCREASEALLOWANCE320(address spender, uint256 addedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE530(_MSGSENDER291(), spender, _allowances[_MSGSENDER291()][spender].ADD420(addedValue));
        return true;
    }
    function DECREASEALLOWANCE206(address spender, uint256 subtractedValue) public returns (bool) {	//inject NONSTANDARD NAMING
        _APPROVE530(_MSGSENDER291(), spender, _allowances[_MSGSENDER291()][spender].SUB330(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
    function _TRANSFER774(address sender, address recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].SUB330(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].ADD420(amount);
        emit TRANSFER83(sender, recipient, amount);
    }
    function _MINT15(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.ADD420(amount);
        _balances[account] = _balances[account].ADD420(amount);
        emit TRANSFER83(address(0), account, amount);
    }
    function _BURN489(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].SUB330(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.SUB330(amount);
        emit TRANSFER83(account, address(0), amount);
    }
    function _APPROVE530(address owner, address spender, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit APPROVAL666(owner, spender, amount);
    }
    function _BURNFROM156(address account, uint256 amount) internal {	//inject NONSTANDARD NAMING
        _BURN489(account, amount);
        _APPROVE530(account, _MSGSENDER291(), _allowances[account][_MSGSENDER291()].SUB330(amount, "ERC20: burn amount exceeds allowance"));
    }
}

library SafeMath {
    function ADD420(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function SUB330(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return SUB330(a, b, "SafeMath: subtraction overflow");
    }
    function SUB330(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }
    function MUL670(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function DIV726(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return DIV726(a, b, "SafeMath: division by zero");
    }
    function DIV726(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint256 c = a / b;

        return c;
    }
    function MOD360(uint256 a, uint256 b) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        return MOD360(a, b, "SafeMath: modulo by zero");
    }
    function MOD360(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {	//inject NONSTANDARD NAMING
        require(b != 0, errorMessage);
        return a % b;
    }
}

library Address {
    function ISCONTRACT374(address account) internal view returns (bool) {	//inject NONSTANDARD NAMING
        bytes32 codehash;
        bytes32 accountHash = 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470;
        // solhint-disable-next-line no-inline-assembly
        assembly { codehash := extcodehash(account) }
        return (codehash != 0x0 && codehash != accountHash);
    }
    function TOPAYABLE503(address account) internal pure returns (address payable) {	//inject NONSTANDARD NAMING
        return address(uint160(account));
    }
    function SENDVALUE885(address payable recipient, uint256 amount) internal {	//inject NONSTANDARD NAMING
        require(address(this).balance >= amount, "Address: insufficient balance");

        // solhint-disable-next-line avoid-call-value
        (bool success, ) = recipient.call.value(amount)("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
}

library SafeERC20 {
    using SafeMath for uint256;
    using Address for address;

    function SAFETRANSFER764(IERC20 token, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN671(token, abi.encodeWithSelector(token.TRANSFER700.selector, to, value));
    }

    function SAFETRANSFERFROM658(IERC20 token, address from, address to, uint256 value) internal {	//inject NONSTANDARD NAMING
        CALLOPTIONALRETURN671(token, abi.encodeWithSelector(token.TRANSFERFROM599.selector, from, to, value));
    }

    function SAFEAPPROVE526(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        require((value == 0) || (token.ALLOWANCE581(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        CALLOPTIONALRETURN671(token, abi.encodeWithSelector(token.APPROVE151.selector, spender, value));
    }

    function SAFEINCREASEALLOWANCE552(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE581(address(this), spender).ADD420(value);
        CALLOPTIONALRETURN671(token, abi.encodeWithSelector(token.APPROVE151.selector, spender, newAllowance));
    }

    function SAFEDECREASEALLOWANCE124(IERC20 token, address spender, uint256 value) internal {	//inject NONSTANDARD NAMING
        uint256 newAllowance = token.ALLOWANCE581(address(this), spender).SUB330(value, "SafeERC20: decreased allowance below zero");
        CALLOPTIONALRETURN671(token, abi.encodeWithSelector(token.APPROVE151.selector, spender, newAllowance));
    }
    function CALLOPTIONALRETURN671(IERC20 token, bytes memory data) private {	//inject NONSTANDARD NAMING
        require(address(token).ISCONTRACT374(), "SafeERC20: call to non-contract");

        // solhint-disable-next-line avoid-low-level-calls
        (bool success, bytes memory returndata) = address(token).call(data);
        require(success, "SafeERC20: low-level call failed");

        if (returndata.length > 0) { // Return data is optional
            // solhint-disable-next-line max-line-length
            require(abi.decode(returndata, (bool)), "SafeERC20: ERC20 operation did not succeed");
        }
    }
}

contract pLENDVault {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint256;
    
    struct RewardDivide {
        mapping (address => uint256) amount;
        uint256 time;
    }

    IERC20 public token = IERC20(0x80fB784B7eD66730e8b1DBd9820aFD29931aab03);
    
    address public governance;
    uint256 public totalDeposit;
    mapping(address => uint256) public depositBalances;
    mapping(address => uint256) public rewardBalances;
    address[] public addressIndices;

    mapping(uint256 => RewardDivide) public _rewards;
    uint256 public _rewardCount = 0;

    event WITHDRAWN814(address indexed user, uint256 amount);	//inject NONSTANDARD NAMING
    
    constructor () public {
        governance = msg.sender;
    }
    
    function BALANCE292() public view returns (uint) {	//inject NONSTANDARD NAMING
        return token.BALANCEOF938(address(this));
    }
    
    function SETGOVERNANCE248(address _governance) public {	//inject NONSTANDARD NAMING
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }
    
    function DEPOSITALL266() external {	//inject NONSTANDARD NAMING
        DEPOSIT274(token.BALANCEOF938(msg.sender));
    }
    
    function DEPOSIT274(uint256 _amount) public {	//inject NONSTANDARD NAMING
        require(_amount > 0, "can't deposit 0");
        
        uint arrayLength = addressIndices.length;
        
        bool found = false;
        for (uint i = 0; i < arrayLength; i++) {
            if(addressIndices[i]==msg.sender){
                found=true;
                break;
            }
        }
        
        if(!found){
            addressIndices.push(msg.sender);
        }
        
        uint256 realAmount = _amount.MUL670(995).DIV726(1000);
        uint256 feeAmount = _amount.MUL670(5).DIV726(1000);
        
        address feeAddress = 0xD319d5a9D039f06858263E95235575Bb0Bd630BC;
        address vaultAddress = 0xC5f72C89Bd658ACeD718355115514Ff9AAaeF441; // Vault6 Address
        
        token.SAFETRANSFERFROM658(msg.sender, feeAddress, feeAmount);
        token.SAFETRANSFERFROM658(msg.sender, vaultAddress, realAmount);
        
        totalDeposit = totalDeposit.ADD420(realAmount);
        depositBalances[msg.sender] = depositBalances[msg.sender].ADD420(realAmount);
    }
    
    function REWARD479(uint256 _amount) external {	//inject NONSTANDARD NAMING
        require(_amount > 0, "can't reward 0");
        require(totalDeposit > 0, "totalDeposit must bigger than 0");
        
        token.SAFETRANSFERFROM658(msg.sender, address(this), _amount);

        uint arrayLength = addressIndices.length;
        for (uint i = 0; i < arrayLength; i++) {
            rewardBalances[addressIndices[i]] = rewardBalances[addressIndices[i]].ADD420(_amount.MUL670(depositBalances[addressIndices[i]]).DIV726(totalDeposit));
            _rewards[_rewardCount].amount[addressIndices[i]] = _amount.MUL670(depositBalances[addressIndices[i]]).DIV726(totalDeposit);
        }

        _rewards[_rewardCount].time = block.timestamp;
        _rewardCount++;
    } 
    
    function WITHDRAWALL653() external {	//inject NONSTANDARD NAMING
        WITHDRAW145(rewardBalances[msg.sender]);
    }
    
    function WITHDRAW145(uint256 _amount) public {	//inject NONSTANDARD NAMING
        require(_rewardCount > 0, "no reward amount");
        require(_amount > 0, "can't withdraw 0");

        uint256 availableWithdrawAmount = AVAILABLEWITHDRAW837(msg.sender);

        if (_amount > availableWithdrawAmount) {
            _amount = availableWithdrawAmount;
        }

        token.SAFETRANSFER764(msg.sender, _amount);
        
        rewardBalances[msg.sender] = rewardBalances[msg.sender].SUB330(_amount);
        emit WITHDRAWN814(msg.sender, _amount);
    }

    function AVAILABLEWITHDRAW837(address owner) public view returns(uint256){	//inject NONSTANDARD NAMING
        uint256 availableWithdrawAmount = rewardBalances[owner];
        for (uint256 i = _rewardCount - 1; block.timestamp < _rewards[i].time.ADD420(7 days); --i) {
            availableWithdrawAmount = availableWithdrawAmount.SUB330(_rewards[i].amount[owner].MUL670(_rewards[i].time.ADD420(7 days).SUB330(block.timestamp)).DIV726(7 days));
            if (i == 0) break;
        }
        return availableWithdrawAmount;
    }
}