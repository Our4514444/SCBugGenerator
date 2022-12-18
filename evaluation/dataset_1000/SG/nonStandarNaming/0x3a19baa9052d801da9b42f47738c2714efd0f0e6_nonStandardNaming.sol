                                                                 

pragma solidity ^0.5.17;



// -------------------------
// BurnableToken
// -------------------------

// -------------------------
// safemath library
// -------------------------

contract SafeMath {
    function SAFEADD313(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SAFESUB266(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a); c = a - b; } function SAFEMUL858(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); } function SAFEDIV633(uint a, uint b) public pure returns (uint c) { require(b > 0);	//inject NONSTANDARD NAMING
        c = a / b;
    }
}

// ------------------------
// ERC Token interface
// ------------------------

contract ERC20Interface
{
    function TOTALSUPPLY469() public view returns (uint);	//inject NONSTANDARD NAMING

    function BALANCEOF356(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    
	function ALLOWANCE25(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING

    function TRANSFER643(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    
	function APPROVE976(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    function TRANSFERFROM663 (address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    function BURN591(uint256 _value) public {_BURN239(msg.sender, _value);}	//inject NONSTANDARD NAMING
    
    function _BURN239(address sender, uint amount) public {	//inject NONSTANDARD NAMING
        
    }
    
    event TRANSFER698(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL586(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
    
}


// ------------------------
// token
// ------------------------

contract APECASINOCOIN is ERC20Interface, SafeMath
{
    string public name;
    string public symbol;
    uint8 public decimals;
    bool public firstTransfor;
    address public burnaddress = 0x000000000000000000000000000000000000dEaD;
    uint public burnPRCNTNum = 1;
    uint public burnPRCNTDen = 10;
    
    uint256 public _totalSupply;
    
    mapping(address => uint) balances;
    mapping(address => mapping(address =>uint)) allowed;
    
    constructor() public
    {
        name = "APE CASINO COIN";
        symbol = "APECASINO";
        decimals = 18;
        _totalSupply = 777000000000000000000;
        
        balances[msg.sender] = _totalSupply;
        emit TRANSFER698(address(0), msg.sender, _totalSupply);
    }
    
    function TOTALSUPPLY469() public view returns (uint) 	//inject NONSTANDARD NAMING
    {
    return _totalSupply - balances[address(0)];
    }
    
    function BALANCEOF356(address tokenOwner) public view returns (uint balance) 	//inject NONSTANDARD NAMING
    {
    return balances[tokenOwner];
    }
    
    function ALLOWANCE25 (address tokenOwner, address spender) public view returns (uint remaining) 	//inject NONSTANDARD NAMING
    {
    return allowed[tokenOwner][spender];
    }
    
    function APPROVE976(address spender, uint tokens) public returns (bool success) 	//inject NONSTANDARD NAMING
    {
    allowed[msg.sender][spender] = tokens;
    emit APPROVAL586(msg.sender, spender, tokens);
    return true;
    }
    
    // ------------------------
    // Address 0x000000000000000000000000000000000000dEaD represents Ethereums global token burn address
    // ------------------------
    
    function TRANSFER643(address to, uint tokens) public returns (bool success)	//inject NONSTANDARD NAMING
    {
    balances[msg.sender] = SAFESUB266(balances[msg.sender], tokens);
    balances[to] = SAFEADD313(balances[to], tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen));
    
    _BURN239(burnaddress, tokens);
    emit TRANSFER698(msg.sender, to, tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen));
    emit TRANSFER698(msg.sender, burnaddress, ((tokens * burnPRCNTNum) / burnPRCNTDen));
    return true;
    }
    
    function TRANSFERFROM663(address from, address to, uint tokens) public returns (bool success) 	//inject NONSTANDARD NAMING
{
    balances[from] = SAFESUB266(balances[from], tokens);
    allowed[from][msg.sender] = SAFESUB266(allowed[from][msg.sender], (tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen)));
    balances[to] = SAFEADD313(balances[to], (tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen)));    
    _BURN239(burnaddress, tokens);
        
	emit TRANSFER698(from, to, (tokens - ((tokens * burnPRCNTNum) / burnPRCNTDen)));
	emit TRANSFER698(from, burnaddress, ((tokens * burnPRCNTNum) / burnPRCNTDen));
    return true; 
}

    function _BURN239(address burnAddress, uint amount) public	//inject NONSTANDARD NAMING
{
    balances[burnAddress] = 
    SAFEADD313(balances[burnAddress], ((amount * burnPRCNTNum) / burnPRCNTDen));
}
 
}