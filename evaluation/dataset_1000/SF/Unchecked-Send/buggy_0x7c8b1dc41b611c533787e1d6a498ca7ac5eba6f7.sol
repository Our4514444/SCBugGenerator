pragma solidity ^0.5.5;

// ----------------------------------------------------------------------------
// 'RNBW2' token contract
//
// Deployed to : 
// Symbol      : RNBW2
// Name        : RNBW2 Token
// Description : Virtual Geospatial Networking Asset
// Total supply: Dynamic ITO
// Decimals    : 18
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
contract SafeMath {
    function safeAdd(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
    function safeSub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
    function safeMul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
    function safeDiv(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function totalSupply() public view returns (uint);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address payable token, bytes memory data) public;
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address payable public _owner;
    address payable private _newOwner;

  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        _owner = msg.sender;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == _owner);
        _;
    }

    function transferOwnership(address payable newOwner) public onlyOwner {
        _newOwner = newOwner;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function acceptOwnership() public {
        require(msg.sender == _newOwner);
        emit OwnershipTransferred(_owner, _newOwner);
        _owner = _newOwner;
        _newOwner = address(0);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and assisted
// token transfers
// ----------------------------------------------------------------------------
contract RNBW2 is ERC20Interface, Owned, SafeMath {

    string public symbol;
    string public name;
    string public description;
    uint8 public decimals;    
    uint private _startDate;
    uint private _bonusOneEnds;
    uint private _bonusTwoEnds;
    uint private _endDate;
    
    uint256 private _internalCap;
    uint256 private _softCap;
    uint256 private _totalSupply;

    mapping(address => uint256) _balances;
    mapping(address => mapping(address => uint256)) _allowed;
    mapping(address => bool) _freezeState;

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor(
        address payable minter) public {
        
        name   = "RNBW2 Token";
        description = "RNBW2 Token for PowerBrain.shop appliance";
        symbol = "RNBW2";
        decimals = 18;
        _internalCap = 25000000 * 1000000000000000000; //18 decimals
        _softCap = _internalCap * 2;
        
        _startDate = now;        
        _bonusOneEnds = now + 4 days ;
        _bonusTwoEnds = now + 12 days;
        _endDate = now + 26 days;
            
        _owner = minter;
        _balances[_owner] = _internalCap;  
        _totalSupply = _internalCap;
        emit Transfer(address(0), _owner, _internalCap);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    modifier IcoSuccessful {
        require(now >= _endDate);
        require(_totalSupply >= _softCap);
        _;
    }

    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public view returns (uint) {
        return _totalSupply - _balances[address(0)];
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return _balances[tokenOwner];
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    
    function isFreezed(address tokenOwner) public view returns (bool freezed) {
        return _freezeState[tokenOwner];
    }
function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint256 tokens) public IcoSuccessful returns (bool success) {
        require(_freezeState[msg.sender] == false);
        
        _balances[msg.sender] = safeSub(_balances[msg.sender], tokens);
        _balances[to] = safeAdd(_balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    //
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public IcoSuccessful returns (bool success) {
        require( _freezeState[spender] == false);
        _allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public IcoSuccessful returns (bool success) {
        require( _freezeState[from] == false && _freezeState[to] == false);
        
        _balances[from] = safeSub(_balances[from], tokens);
        _allowed[from][msg.sender] = safeSub(_allowed[from][msg.sender], tokens);
        _balances[to] = safeAdd(_balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        require(_freezeState[spender] == false);
        return _allowed[tokenOwner][spender];
    }
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account. The `spender` contract function
    // `receiveApproval(...)` is then executed
    // ------------------------------------------------------------------------
    function approveAndCall(address spender, uint tokens, bytes memory data) public IcoSuccessful returns (bool success) {
        require(_freezeState[spender] == false);
        _allowed[msg.sender][spender] = tokens;
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, _owner, data);
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}

    // ------------------------------------------------------------------------
    // 1 RNBW2 Tokens per 1 finney
    // ------------------------------------------------------------------------
    function purchase() public payable {
    
        require(now >= _startDate && now <= _endDate);
        /*require(msg.value >= 500);*/
        
        uint256 weiValue = msg.value;
        uint256 tokens = safeMul(weiValue, 1);// 1 finney = 1000000000000000 wei
        
        if (now <= _bonusOneEnds) {
            tokens = safeDiv(safeMul(tokens, 15) , 10);
        } else {
            if (now <= _bonusTwoEnds) {
                tokens = safeDiv(safeMul( tokens, 12) , 10);
            }
        }        
        _freezeState[msg.sender] = false;
        _balances[msg.sender] = safeAdd(_balances[msg.sender], tokens);
        _totalSupply = safeAdd(_totalSupply, tokens);
        emit Transfer(address(0), msg.sender, tokens);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function () payable external {
        purchase();
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function withdraw() public onlyOwner returns (bool success) {
        _owner.transfer(address(this).balance);
        return true;
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function freeze(address account) public onlyOwner returns (bool success) {
        require(account != _owner && account != address(0));
        _freezeState[account] = true;
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function unfreeze(address account) public onlyOwner returns (bool success) {
        require(account != _owner && account != address(0));
        _freezeState[account] = false;
        return true;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
   
    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(_owner, tokens);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}