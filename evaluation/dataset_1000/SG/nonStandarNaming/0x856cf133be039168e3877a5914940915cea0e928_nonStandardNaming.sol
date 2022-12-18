pragma solidity ^0.5.1;

contract Token{
    
    // ERC20 Token, with the addition of symbol, name and decimals and a
    // fixed supply
    
    string public constant symbol93 = 'NGN-TIG';	//inject NONSTANDARD NAMING
    string public constant name578 = 'NGN Tigereum';	//inject NONSTANDARD NAMING
    uint8 public constant decimals844 = 2;	//inject NONSTANDARD NAMING
    uint public constant _totalsupply677 = 100000000 * 10**uint(decimals844);	//inject NONSTANDARD NAMING
    address public owner;
    string public webAddress;
    
    // Balances for each account
    mapping(address => uint256) balances;
    
    // Owner of account approves the transfer of an amount to another account
    mapping(address => mapping(address => uint256)) allowed;
    
    constructor() public {
        balances[msg.sender] = _totalsupply677;
        owner = msg.sender;
        webAddress = "https://tigereum.io";
    }
    
    function TOTALSUPPLY953() public pure returns (uint) {	//inject NONSTANDARD NAMING
        return _totalsupply677;
    }
    
    // Get the token balance for account { tokenOwner }
    function BALANCEOF883(address tokenOwner) public view returns (uint balance) {	//inject NONSTANDARD NAMING
        return balances[tokenOwner];
    }
    
    // Transfer the balance from owner's account to another account
    function TRANSFER229(address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        require( balances[msg.sender] >= tokens && tokens > 0 );
        balances[msg.sender] -= tokens;
        balances[to] += tokens;
        emit TRANSFER722(msg.sender, to, tokens);
        return true;
    }
    
    // Send {tokens} amount of tokens from address {from} to address {to}
    // The transferFrom method is used for a withdraw workflow, allowing contracts to send
    // tokens on your behalf
    function TRANSFERFROM707(address from, address to, uint tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        require( allowed[from][msg.sender] >= tokens && balances[from] >= tokens && tokens > 0 );
        balances[from] -= tokens;
        allowed[from][msg.sender] -= tokens;
        balances[to] += tokens;
        emit TRANSFER722(from, to, tokens);
        return true;
    }
    
    // Allow {spender} to withdraw from your account, multiple times, up to the {tokens} amount.
    function APPROVE308(address sender, uint256 tokens) public returns (bool success) {	//inject NONSTANDARD NAMING
        allowed[msg.sender][sender] = tokens;
        emit APPROVAL303(msg.sender, sender, tokens);
        return true;
    }
    
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    function ALLOWANCE151(address tokenOwner, address spender) public view returns (uint remaining) {	//inject NONSTANDARD NAMING
        return allowed[tokenOwner][spender];
    }
    
    
    event TRANSFER722(address indexed _from, address indexed _to, uint256 _amount);	//inject NONSTANDARD NAMING
    event APPROVAL303(address indexed _owner, address indexed _to, uint256 _amount);	//inject NONSTANDARD NAMING
}