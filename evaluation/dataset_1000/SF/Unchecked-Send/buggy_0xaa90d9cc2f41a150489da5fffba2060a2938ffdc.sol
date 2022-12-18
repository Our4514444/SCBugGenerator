/**
 *Submitted for verification at Etherscan.io on 2020-09-17
*/

pragma solidity ^0.5.17;

interface IERC20 {
    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);
    function transfer(address recipient, uint amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
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
    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}

library SafeMath {
    function add(uint a, uint b) internal pure returns (uint) {
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }
    function sub(uint a, uint b) internal pure returns (uint) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }
    function sub(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }
    function mul(uint a, uint b) internal pure returns (uint) {
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }
    function div(uint a, uint b) internal pure returns (uint) {
        return div(a, b, "SafeMath: division by zero");
    }
    function div(uint a, uint b, string memory errorMessage) internal pure returns (uint) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function isContract(address account) internal view returns (bool) {
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

    function safeTransfer(IERC20 token, address to, uint value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transfer.selector, to, value));
    }

    function safeTransferFrom(IERC20 token, address from, address to, uint value) internal {
        callOptionalReturn(token, abi.encodeWithSelector(token.transferFrom.selector, from, to, value));
    }

    function safeApprove(IERC20 token, address spender, uint value) internal {
        require((value == 0) || (token.allowance(address(this), spender) == 0),
            "SafeERC20: approve from non-zero to non-zero allowance"
        );
        callOptionalReturn(token, abi.encodeWithSelector(token.approve.selector, spender, value));
    }
    function callOptionalReturn(IERC20 token, bytes memory data) private {
        require(address(token).isContract(), "SafeERC20: call to non-contract");

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
    function getPriceUSD(address reserve) external view returns (uint);
}

contract SyntheticRebaseDollar is ERC20Detailed {
    using SafeERC20 for IERC20;
    using Address for address;
    using SafeMath for uint;

    // Oracle used for price debt data (external to the AMM balance to avoid internal manipulation)
    Oracle public constant LINK = Oracle(0x271bf4568fb737cc2e6277e9B1EE0034098cDA2a);
    
    mapping (address => uint) public userCredit;
    // user => token => credit
    mapping (address => mapping(address => uint)) public credit;
    // user => token => balance
    mapping (address => mapping(address => uint)) public balances;
    // user => address[] markets (credit markets supplied to)
    mapping (address => address[]) public markets;
    address[] public market;
    mapping (address => bool) public exists;
    uint public constant BASE = 10000;
    
    constructor () public ERC20Detailed("Synthetic Rebase USD", "srUSD", 8) {}
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    
    function factor() public view returns (uint) {
        uint _collateral = 0;
        for (uint i = 0; i < market.length; i++) {
            uint _value = IERC20(market[i]).balanceOf(address(this));
            _collateral = _collateral.add(LINK.getPriceUSD(market[i]).mul(_value).div(uint256(10)**ERC20Detailed(market[i]).decimals()));
        }
        if (_collateral > 0) {
            return _totalSupply.mul(BASE).div(_collateral);
        }
        return BASE;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    
    function depositAll(address token) external {
        deposit(token, IERC20(token).balanceOf(msg.sender));
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    
    function deposit(address token, uint amount) public {
        _deposit(token, amount);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    
    function getCredit(address owner, address token) public view returns (uint) {
        return credit[owner][token].mul(factor()).div(BASE);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    
    function _getCredit(address owner, address token, uint _factor) internal view returns (uint) {
        return credit[owner][token].mul(_factor).div(BASE);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    
    function getUserCredit(address owner) public view returns (uint) {
        return userCredit[owner].mul(factor()).div(BASE);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    
    function _getUserCredit(address owner, uint _factor) internal view returns (uint) {
        return userCredit[owner].mul(_factor).div(BASE);
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    
    function _deposit(address token, uint amount) internal {
        uint _value = LINK.getPriceUSD(token).mul(amount).div(uint256(10)**ERC20Detailed(token).decimals());
        require(_value > 0, "!value");
        
        IERC20(token).safeTransferFrom(msg.sender, address(this), amount);

        // Assign collateral to the user
        balances[msg.sender][token] = balances[msg.sender][token].add(amount);
        
        credit[msg.sender][token] = credit[msg.sender][token].add(_value);
        userCredit[msg.sender] = userCredit[msg.sender].add(_value);
        
        _mint(msg.sender, _value);
        
        markets[msg.sender].push(token);
        if (!exists[token]) {
            market.push(token);
            exists[token] = true;
        }
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    
    function withdrawAll(address token) external {
        _withdraw(token, IERC20(this).balanceOf(msg.sender));
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    
    function withdraw(address token, uint amount) external {
        _withdraw(token, amount);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    // UNSAFE: No slippage protection, should not be called directly
    function _withdraw(address token, uint amount) internal {
        
        uint _factor = factor(); // call once to minimize sub calls in getCredit and getUserCredit
        
        uint _credit = _getCredit(msg.sender, token, _factor);
        uint _token = balances[msg.sender][token];
        
        if (_credit < amount) {
            amount = _credit;
        }
        
        _burn(msg.sender, amount, _factor);
        credit[msg.sender][token] = _getCredit(msg.sender, token, _factor).sub(amount);
        userCredit[msg.sender] = _getUserCredit(msg.sender, _factor).sub(amount);
        
        // Calculate % of collateral to release
        _token = _token.mul(amount).div(_credit);
        
        IERC20(token).safeTransfer(msg.sender, _token);
        balances[msg.sender][token] = balances[msg.sender][token].sub(_token);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    
    function getMarkets(address owner) external view returns (address[] memory) {
        return markets[owner];
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    
    function adjusted(uint amount) external view returns (uint) {
        return amount = amount.mul(BASE).div(factor());
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    
    mapping (address => uint) private _balances;
    mapping (address => mapping (address => uint)) private _allowances;
    uint private _totalSupply;
    
    function totalSupply() public view returns (uint) {
        return _totalSupply.mul(factor()).div(BASE);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function totalSupplyBase() public view returns (uint) {
        return _totalSupply;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address account) public view returns (uint) {
        return _balances[account].mul(factor()).div(BASE);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOfBase(address account) public view returns (uint) {
        return _balances[account];
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount.mul(BASE).div(factor()), amount);
        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender].mul(factor()).div(BASE);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function _allowance(address owner, address spender, uint _factor) internal view returns (uint) {
        return _allowances[owner][spender].mul(_factor).div(BASE);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint amount) public returns (bool) {
        _approve(msg.sender, spender, amount.mul(BASE).div(factor()));
        return true;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        uint _factor = factor();
        _transfer(sender, recipient, amount.mul(BASE).div(_factor), amount);
        _approve(sender, msg.sender, _allowance(sender, msg.sender, _factor).sub(amount.mul(BASE).div(_factor), "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        uint _factor = factor();
        _approve(msg.sender, spender, _allowance(msg.sender, spender, _factor).add(addedValue.mul(BASE).div(_factor)));
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        uint _factor = factor();
        _approve(msg.sender, spender, _allowance(msg.sender, spender, _factor).sub(subtractedValue.mul(BASE).div(_factor), "ERC20: decreased allowance below zero"));
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function _transfer(address sender, address recipient, uint amount, uint sent) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, sent);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    function _mint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");
        amount = amount.mul(BASE).div(factor());
        
        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    function _burn(address account, uint amount, uint _factor) internal {
        require(account != address(0), "ERC20: burn from the zero address");
        
        amount = amount.mul(BASE).div(_factor);
        
        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}