/**
 *Submitted for verification at Etherscan.io on 2020-09-29
*/

/**
 *Submitted for verification at Etherscan.io on 2020-09-28
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

contract ERC20 is IERC20 {
    using SafeMath for uint;

    mapping (address => uint) private _balances;

    mapping (address => mapping (address => uint)) private _allowances;

    uint private _totalSupply;
    function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
    function balanceOf(address account) public view returns (uint) {
        return _balances[account];
    }
    function transfer(address recipient, uint amount) public returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }
    function allowance(address owner, address spender) public view returns (uint) {
        return _allowances[owner][spender];
    }
    function approve(address spender, uint amount) public returns (bool) {
        _approve(msg.sender, spender, amount);
        return true;
    }
    function transferFrom(address sender, address recipient, uint amount) public returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function increaseAllowance(address spender, uint addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function decreaseAllowance(address spender, uint subtractedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    function _transfer(address sender, address recipient, uint amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount, "ERC20: transfer amount exceeds balance");
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    function _mint(address account, uint amount) internal {
        require(account != address(0), "ERC20: mint to the zero address");

        _totalSupply = _totalSupply.add(amount);
        _balances[account] = _balances[account].add(amount);
        emit Transfer(address(0), account, amount);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function _burn(address account, uint amount) internal {
        require(account != address(0), "ERC20: burn from the zero address");

        _balances[account] = _balances[account].sub(amount, "ERC20: burn amount exceeds balance");
        _totalSupply = _totalSupply.sub(amount);
        emit Transfer(account, address(0), amount);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    function _approve(address owner, address spender, uint amount) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

interface BondingCurve {
    function calculatePurchaseReturn(uint _supply,  uint _reserveBalance, uint32 _reserveRatio, uint _depositAmount) external view returns (uint);
    function calculateSaleReturn(uint _supply, uint _reserveBalance, uint32 _reserveRatio, uint _sellAmount) external view returns (uint);
}

contract ContinuousToken is ERC20 {
    using SafeMath for uint;

    uint public scale = 10**18;
    uint public reserveBalance = 1*10**15;
    uint32 public reserveRatio;
    
    BondingCurve constant public CURVE = BondingCurve(0x16F6664c16beDE5d70818654dEfef11769D40983);

    function _buy(uint _amount) internal returns (uint _bought) {
        _bought = _continuousMint(_amount);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function _sell(uint _amount) internal returns (uint _sold) {
        _sold = _continuousBurn(_amount);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function calculateContinuousMintReturn(uint _amount) public view returns (uint mintAmount) {
        return CURVE.calculatePurchaseReturn(totalSupply(), reserveBalance, uint32(reserveRatio), _amount);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function calculateContinuousBurnReturn(uint _amount) public view returns (uint burnAmount) {
        return CURVE.calculateSaleReturn(totalSupply(), reserveBalance, uint32(reserveRatio), _amount);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function _continuousMint(uint _deposit) internal returns (uint) {
        uint amount = calculateContinuousMintReturn(_deposit);
        reserveBalance = reserveBalance.add(_deposit);
        return amount;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function _continuousBurn(uint _amount) internal returns (uint) {
        uint reimburseAmount = calculateContinuousBurnReturn(_amount);
        reserveBalance = reserveBalance.sub(reimburseAmount);
        return reimburseAmount;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
}

contract EminenceCurrency is ContinuousToken, ERC20Detailed {
    mapping(address => bool) public gamemasters;
    mapping(address => bool) public npcs;
    
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event AddGM(address indexed newGM, address indexed gm);
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  event RevokeGM(address indexed newGM, address indexed gm);
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event AddNPC(address indexed newNPC, address indexed gm);
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event RevokeNPC(address indexed newNPC, address indexed gm);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event CashShopBuy(address _from, uint  _amount, uint _deposit);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event CashShopSell(address _from, uint  _amount, uint _reimbursement);
    
    IERC20 constant public DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    
    constructor (string memory name, string memory symbol, uint32 _reserveRatio) public ERC20Detailed(name, symbol, 18) {
        gamemasters[msg.sender] = true;
        reserveRatio = _reserveRatio;
        _mint(msg.sender, 1*scale);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    function addNPC(address _npc) external {
        require(gamemasters[msg.sender], "!gm");
        npcs[_npc] = true;
        emit AddNPC(_npc, msg.sender);
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    function revokeNPC(address _npc) external {
        require(gamemasters[msg.sender], "!gm");
        npcs[_npc] = false;
        emit RevokeNPC(_npc, msg.sender);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function addGM(address _gm) external {
        require(gamemasters[msg.sender]||gamemasters[tx.origin], "!gm");
        gamemasters[_gm] = true;
        emit AddGM(_gm, msg.sender);
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    function revokeGM(address _gm) external {
        require(gamemasters[msg.sender], "!gm");
        gamemasters[_gm] = false;
        emit RevokeGM(_gm, msg.sender);
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    function award(address _to, uint _amount) external {
        require(gamemasters[msg.sender], "!gm");
        _mint(_to, _amount);
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    function claim(address _from, uint _amount) external {
        require(gamemasters[msg.sender]||npcs[msg.sender], "!gm");
        _burn(_from, _amount);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function buy(uint _amount, uint _min) external returns (uint _bought) {
        _bought = _buy(_amount);
        require(_bought >= _min, "slippage");
        DAI.transferFrom(msg.sender, address(this), _amount);
        _mint(msg.sender, _bought);
        emit CashShopBuy(msg.sender, _bought, _amount);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function sell(uint _amount, uint _min) external returns (uint _bought) {
        _bought = _sell(_amount);
        require(_bought >= _min, "slippage");
        _burn(msg.sender, _amount);
        DAI.transfer(msg.sender, _bought);
        emit CashShopSell(msg.sender, _amount, _bought);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
}