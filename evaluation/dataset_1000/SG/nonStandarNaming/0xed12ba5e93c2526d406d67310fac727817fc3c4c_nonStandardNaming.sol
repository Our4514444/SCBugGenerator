                                                                 

pragma solidity 0.5.17;
contract ERC20Interface {
    function TOTALSUPPLY104() public view returns (uint);	//inject NONSTANDARD NAMING
    function BALANCEOF774(address tokenOwner) public view returns (uint balance);	//inject NONSTANDARD NAMING
    function ALLOWANCE348(address tokenOwner, address spender) public view returns (uint remaining);	//inject NONSTANDARD NAMING
    function TRANSFER814(address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function APPROVE587(address spender, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING
    function TRANSFERFROM209(address from, address to, uint tokens) public returns (bool success);	//inject NONSTANDARD NAMING

    event TRANSFER215(address indexed from, address indexed to, uint tokens);	//inject NONSTANDARD NAMING
    event APPROVAL463(address indexed tokenOwner, address indexed spender, uint tokens);	//inject NONSTANDARD NAMING
}
contract SafeMath {
    function SAFEADD421(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        c = a + b;
        require(c >= a);
    }
    function SAFESUB377(uint a, uint b) public pure returns (uint c) {	//inject NONSTANDARD NAMING
        require(b <= a); c = a - b; } function SAFEMUL997(uint a, uint b) public pure returns (uint c) { c = a * b; require(a == 0 || c / a == b); } function SAFEDIV919(uint a, uint b) public pure returns (uint c) { require(b > 0);	//inject NONSTANDARD NAMING
        c = a / b;
    }
}
contract PimpCoin is ERC20Interface, SafeMath {
    string public name;
    string public symbol;
    uint8 public decimals;
    
    uint256 public _totalSupply;
    
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) allowed;
    
    constructor() public {
        name = "PimpCoin";
        symbol = "PIMP";
        decimals = 10;
        _totalSupply = 10000000;
        balances[msg.sender] = _totalSupply;
        emit TRANSFER215(address(0), msg.sender, _totalSupply);
    }
    function TOTALSUPPLY104() public view returns (uint) {	//inject NONSTANDARD NAMING
        return _totalSupply  - balances[address(0)];
    }
    function BALANCEOF774(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }
    function ALLOWANCE348(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }
    function APPROVE587(address spender, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][spender] = tokens;
        emit APPROVAL463(msg.sender, spender, tokens);
        return true;
    }
    function TRANSFER814(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[msg.sender] = SAFESUB377(balances[msg.sender], tokens);
        balances[to] = SAFEADD421(balances[to], tokens);
        emit TRANSFER215(msg.sender, to, tokens);
        return true;
    }
    function TRANSFERFROM209(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        balances[from] = SAFESUB377(balances[from], tokens);
        allowed[from][msg.sender] = SAFESUB377(allowed[from][msg.sender], tokens);
        balances[to] = SAFEADD421(balances[to], tokens);
        emit TRANSFER215(from, to, tokens);
        return true;
    }
}