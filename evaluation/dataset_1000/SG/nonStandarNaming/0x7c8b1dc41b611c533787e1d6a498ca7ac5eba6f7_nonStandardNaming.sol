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
    function SAFEADD15(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SAFESUB386(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a);
        c = a - b;
    }
    function SAFEMUL2(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function SAFEDIV841(uint a, uint b) internal pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b > 0);
        c = a / b;
    }
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
contract ERC20Interface {
    function TOTALSUPPLY830() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF786(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE761(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER712(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE958(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM118(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER667(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL838(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}

// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
    function RECEIVEAPPROVAL489(address from, uint256 tokens, address payable token, bytes memory data) public;	//inject NONSTANDARD NAMING
}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address payable public _owner;
    address payable private _newOwner;

    event OWNERSHIPTRANSFERRED492(address indexed _from, address indexed _to);	//inject NONSTANDARD NAMING

    constructor() public {
        _owner = msg.sender;
    }

    modifier ONLYOWNER354 {	//inject NONSTANDARD NAMING
        require(msg.sender == _owner);
        _;
    }

    function TRANSFEROWNERSHIP403(address payable newOwner) public ONLYOWNER354 {	//inject NONSTANDARD NAMING
        _newOwner = newOwner;
    }

    function ACCEPTOWNERSHIP646() public {	//inject NONSTANDARD NAMING
        require(msg.sender == _newOwner);
        emit OWNERSHIPTRANSFERRED492(_owner, _newOwner);
        _owner = _newOwner;
        _newOwner = address(0);
    }
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
        emit TRANSFER667(address(0), _owner, _internalCap);
    }

    modifier ICOSUCCESSFUL293 {	//inject NONSTANDARD NAMING
        require(now >= _endDate);
        require(_totalSupply >= _softCap);
        _;
    }

    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function TOTALSUPPLY830() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply - _balances[address(0)];
    }

    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function BALANCEOF786(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return _balances[tokenOwner];
    }
    
    function ISFREEZED996(address tokenOwner) public view returns (bool freezed) {	//inject NONSTANDARD NAMING
        return _freezeState[tokenOwner];
    }

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function TRANSFER712(address to, uint256 tokens) public ICOSUCCESSFUL293 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_freezeState[msg.sender] == false);
        
        _balances[msg.sender] = SAFESUB386(_balances[msg.sender], tokens);
        _balances[to] = SAFEADD15(_balances[to], tokens);
        emit TRANSFER667(msg.sender, to, tokens);
        return true;
    }

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    //
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces
    // ------------------------------------------------------------------------
    function APPROVE958(address spender, uint tokens) public ICOSUCCESSFUL293 returns (bool success) {	//inject NONSTANDARD NAMING
        require( _freezeState[spender] == false);
        _allowed[msg.sender][spender] = tokens;
        emit APPROVAL838(msg.sender, spender, tokens);
        return true;
    }

    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function TRANSFERFROM118(address from, address to, uint tokens) public ICOSUCCESSFUL293 returns (bool success) {	//inject NONSTANDARD NAMING
        require( _freezeState[from] == false && _freezeState[to] == false);
        
        _balances[from] = SAFESUB386(_balances[from], tokens);
        _allowed[from][msg.sender] = SAFESUB386(_allowed[from][msg.sender], tokens);
        _balances[to] = SAFEADD15(_balances[to], tokens);
        emit TRANSFER667(from, to, tokens);
        return true;
    }

    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function ALLOWANCE761(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        require(_freezeState[spender] == false);
        return _allowed[tokenOwner][spender];
    }

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account. The `spender` contract function
    // `receiveApproval(...)` is then executed
    // ------------------------------------------------------------------------
    function APPROVEANDCALL174(address spender, uint tokens, bytes memory data) public ICOSUCCESSFUL293 returns (bool success) {	//inject NONSTANDARD NAMING
        require(_freezeState[spender] == false);
        _allowed[msg.sender][spender] = tokens;
        ApproveAndCallFallBack(spender).RECEIVEAPPROVAL489(msg.sender, tokens, _owner, data);
        emit APPROVAL838(msg.sender, spender, tokens);
        return true;
    }

    // ------------------------------------------------------------------------
    // 1 RNBW2 Tokens per 1 finney
    // ------------------------------------------------------------------------
    function PURCHASE159() public payable {	//inject NONSTANDARD NAMING
    
        require(now >= _startDate && now <= _endDate);
                                      
        
        uint256 weiValue = msg.value;
        uint256 tokens = SAFEMUL2(weiValue, 1);// 1 finney = 1000000000000000 wei
        
        if (now <= _bonusOneEnds) {
            tokens = SAFEDIV841(SAFEMUL2(tokens, 15) , 10);
        } else {
            if (now <= _bonusTwoEnds) {
                tokens = SAFEDIV841(SAFEMUL2( tokens, 12) , 10);
            }
        }        
        _freezeState[msg.sender] = false;
        _balances[msg.sender] = SAFEADD15(_balances[msg.sender], tokens);
        _totalSupply = SAFEADD15(_totalSupply, tokens);
        emit TRANSFER667(address(0), msg.sender, tokens);
    }
    
    function () payable external {
        PURCHASE159();
    }

    function WITHDRAW761() public ONLYOWNER354 returns (bool success) {	//inject NONSTANDARD NAMING
        _owner.transfer(address(this).balance);
        return true;
    }

    function FREEZE683(address account) public ONLYOWNER354 returns (bool success) {	//inject NONSTANDARD NAMING
        require(account != _owner && account != address(0));
        _freezeState[account] = true;
        return true;
    }
    
    function UNFREEZE860(address account) public ONLYOWNER354 returns (bool success) {	//inject NONSTANDARD NAMING
        require(account != _owner && account != address(0));
        _freezeState[account] = false;
        return true;
    }
   
    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function TRANSFERANYERC20TOKEN818(address tokenAddress, uint tokens) public ONLYOWNER354 returns (bool success) {	//inject NONSTANDARD NAMING
        return ERC20Interface(tokenAddress).TRANSFER712(_owner, tokens);
    }
}