/**
 *Submitted for verification at Etherscan.io on 2020-08-22
*/

pragma solidity 0.5.17;

library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);
        return c;
    }
    
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;
        return c;
    }
    
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        
        uint256 c = a * b;
        require(c / a == b);
        return c;
    }
}

contract ReentrancyGuard { 
    bool private _notEntered; 
    
    function _initReentrancyGuard() internal {
        _notEntered = true;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);} 
}

contract LexTokenLite is ReentrancyGuard {
    using SafeMath for uint256;
    
    address payable public owner;
    address public resolver;
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public saleRate;
    uint256 public totalSupply;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupplyCap;
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  bytes32 public message;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  bool public forSale;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  bool private initialized;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  bool public transferable; 
    
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 amount);
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 amount);
    
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint256)) public allowances;
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint256) private balances;
    
    modifier onlyOwner {
        require(msg.sender == owner, "!owner");
        _;
    }
    
    function init(
        string calldata _name, 
        string calldata _symbol, 
        uint8 _decimals, 
        address payable _owner, 
        address _resolver, 
        uint256 ownerSupply, 
        uint256 _saleRate, 
        uint256 saleSupply, 
        uint256 _totalSupplyCap, 
        bytes32 _message, 
        bool _forSale, 
        bool _transferable
    ) external {
        require(!initialized, "initialized"); 
        require(ownerSupply.add(saleSupply) <= _totalSupplyCap, "capped");
        
        name = _name; 
        symbol = _symbol; 
        decimals = _decimals; 
        owner = _owner; 
        resolver = _resolver;
        saleRate = _saleRate; 
        totalSupplyCap = _totalSupplyCap; 
        message = _message; 
        forSale = _forSale; 
        initialized = true; 
        transferable = _transferable; 
        balances[owner] = balances[owner].add(ownerSupply);
        balances[address(this)] = balances[address(this)].add(saleSupply);
        totalSupply = ownerSupply.add(saleSupply);
        
        emit Transfer(address(0), owner, ownerSupply);
        emit Transfer(address(0), address(this), saleSupply);
        _initReentrancyGuard(); 
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    
    function() external payable { // SALE 
        require(forSale, "!forSale");
        
        (bool success, ) = owner.call.value(msg.value)("");
        require(success, "!transfer");
        uint256 amount = msg.value.mul(saleRate); 
        _transfer(address(this), msg.sender, amount);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);} 
    
    function approve(address spender, uint256 amount) external returns (bool) {
        require(amount == 0 || allowances[msg.sender][spender] == 0, "!reset"); 
        
        allowances[msg.sender][spender] = amount; 
        
        emit Approval(msg.sender, spender, amount); 
        return true;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    
    function balanceResolution(address sender, address recipient, uint256 amount) external returns (bool) {
        require(msg.sender == resolver, "!resolver"); 
        
        _transfer(sender, recipient, amount); 
        
        return true;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    
    function burn(uint256 amount) external {
        balances[msg.sender] = balances[msg.sender].sub(amount); 
        totalSupply = totalSupply.sub(amount); 
        
        emit Transfer(msg.sender, address(0), amount);
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
    
    function _transfer(address sender, address recipient, uint256 amount) internal {
        balances[sender] = balances[sender].sub(amount); 
        balances[recipient] = balances[recipient].add(amount); 
        
        emit Transfer(sender, recipient, amount); 
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
    
    function transfer(address recipient, uint256 amount) external returns (bool) {
        require(transferable, "!transferable"); 
        
        _transfer(msg.sender, recipient, amount);
        
        return true;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    
    function transferBatch(address[] calldata recipient, uint256[] calldata amount) external returns (bool) {
        require(transferable, "!transferable");
        require(recipient.length == amount.length, "!recipient/amount");
        
        for (uint256 i = 0; i < recipient.length; i++) {
            _transfer(msg.sender, recipient[i], amount[i]);
        }
        
        return true;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
    
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        require(transferable, "!transferable");
        
        _transfer(sender, recipient, amount);
        allowances[sender][msg.sender] = allowances[sender][msg.sender].sub(amount); 
        
        return true;
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
    
    /**************
    OWNER FUNCTIONS
    **************/
    function mint(address recipient, uint256 amount) external onlyOwner {
        require(totalSupply.add(amount) <= totalSupplyCap, "capped"); 
        
        balances[recipient] = balances[recipient].add(amount); 
        totalSupply = totalSupply.add(amount); 
        
        emit Transfer(address(0), recipient, amount); 
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
    
    function mintBatch(address[] calldata recipient, uint256[] calldata amount) external onlyOwner {
        require(recipient.length == amount.length, "!recipient/amount");
        
        for (uint256 i = 0; i < recipient.length; i++) {
            balances[recipient[i]] = balances[recipient[i]].add(amount[i]); 
            totalSupply = totalSupply.add(amount[i]);
            emit Transfer(address(0), recipient[i], amount[i]); 
        }
        
        require(totalSupply <= totalSupplyCap, "capped");
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function updateMessage(bytes32 _message) external onlyOwner {
        message = _message;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    function updateOwner(address payable _owner) external onlyOwner {
        owner = _owner;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    
    function updateResolver(address _resolver) external onlyOwner {
        resolver = _resolver;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function updateSale(uint256 amount, bool _forSale) external onlyOwner {
        require(totalSupply.add(amount) <= totalSupplyCap, "capped");
        
        forSale = _forSale;
        balances[address(this)] = balances[address(this)].add(amount); 
        totalSupply = totalSupply.add(amount); 
        
        emit Transfer(address(0), address(this), amount);
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    function updateSaleRate(uint256 _saleRate) external onlyOwner {
        saleRate = _saleRate;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function updateTransferability(bool _transferable) external onlyOwner {
        transferable = _transferable;
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
}